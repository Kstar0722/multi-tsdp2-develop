from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

from strategies.models import Strategy, Signal
from quotes.models import Instrument


class Board(models.Model):
    """Board model."""

    TYPE_SIM = 1
    TYPE_IB = 2
    TYPE_C2 = 3
    TYPE_CHOICES = (
        (TYPE_C2, _('Collective2')),
        (TYPE_IB, _('Interactive Brokers')),
        (TYPE_SIM, _('Simulator')),
    )

    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='boards', verbose_name=_('User'))
    type = models.PositiveSmallIntegerField(_('type'), choices=TYPE_CHOICES, db_index=True, default=TYPE_SIM)
    balance = models.DecimalField(_('balance'), max_digits=9, decimal_places=2, default=0)

    class Meta:
        verbose_name = _('Board')
        verbose_name_plural = _('Boards')

    def __str__(self):
        return '{} / {}'.format(self.get_type_display(), self.user)


class BoardField(models.Model):
    """BoardField model."""
    board = models.ForeignKey(Board, related_name='fields', verbose_name=_('Board'))
    strategy = models.ForeignKey(Strategy, related_name='fields', verbose_name=_('Strategy'))
    color = models.CharField(_('color'), max_length=6)

    class Meta:
        verbose_name = _('Board field')
        verbose_name_plural = _('Board fields')

    def __str__(self):
        return '{} / {} / {}'.format(self.board, self.strategy, self.color)


class Chip(models.Model):
    """Chip model."""
    board = models.ForeignKey(Board, related_name='chips', verbose_name=_('Board'))
    field = models.ForeignKey(BoardField, related_name='chips', verbose_name=_('Board field'), null=True, blank=True)
    instruments = models.ManyToManyField(
        Instrument, through='ChipInstruments', related_name='chips', verbose_name=_('Instruments')
    )

    class Meta:
        verbose_name = _('Chip')
        verbose_name_plural = _('Chips')

    def __str__(self):
        return '{} / {}'.format(self.board, self.pk)


class ChipInstruments(models.Model):
    """Intermediary model."""

    chip = models.ForeignKey(Chip)
    instrument = models.ForeignKey(Instrument)

    class Meta:
        unique_together = ('chip', 'instrument')

    def __str__(self):
        return '{} / {}'.format(self.instrument, self.chip)


class Order(models.Model):
    """Order model."""

    TYPE_MOC = 1
    TYPE_IMM = 2
    TYPE_CHOICES = (
        (TYPE_IMM, _('Immediate')),
        (TYPE_MOC, _('Market-on-close')),
    )

    id = models.BigAutoField(primary_key=True)
    board = models.ForeignKey(Board, related_name='orders', verbose_name=_('Board'))
    instrument = models.ForeignKey(Instrument, related_name='orders', verbose_name=_('Instrument'))
    signal = models.ForeignKey(Signal, related_name='orders', verbose_name=_('Signal'))
    chip = models.ForeignKey(Chip, related_name='orders', verbose_name=_('Chip'))
    type = models.PositiveSmallIntegerField(_('type'), choices=TYPE_CHOICES, db_index=True)
    volume = models.DecimalField(_('volume'), max_digits=9, decimal_places=2)
    open_datetime = models.DateTimeField(_('open datetime'))
    close_datetime = models.DateTimeField(_('close datetime'), blank=True, null=True)

    class Meta:
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')

    def __str__(self):
        return '{}'.format(self.pk)
