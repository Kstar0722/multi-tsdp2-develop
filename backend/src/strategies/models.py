from django.db import models
from django.utils.translation import ugettext_lazy as _

from quotes.models import Instrument


class Strategy(models.Model):
    """Strategy model."""

    name = models.CharField(_('name'), max_length=45, unique=True)

    class Meta:
        verbose_name = _('Strategy')
        verbose_name_plural = _('Strategies')

    def __str__(self):
        return self.name


class Signal(models.Model):
    """Signal model."""

    TYPE_BUY = 1
    TYPE_SELL = -1
    TYPE_CLOSE = 0
    TYPE_CHOICES = (
        (TYPE_BUY, _('buy')),
        (TYPE_SELL, _('sell')),
        (TYPE_CLOSE, _('close')),
    )

    id = models.BigAutoField(primary_key=True)
    strategy = models.ForeignKey(Strategy, related_name='signals', verbose_name=_('Strategy'))
    instrument = models.ForeignKey(Instrument, related_name='signals', verbose_name=_('Instrument'))
    type = models.SmallIntegerField(_('type'), choices=TYPE_CHOICES)
    create_datetime = models.DateTimeField(_('create datetime'), auto_now_add=True, db_index=True)

    class Meta:
        verbose_name = _('Signal')
        verbose_name_plural = _('Signals')

    def __str__(self):
        return '{} / {} / {} / {}'.format(self.strategy, self.instrument, self.get_type_display(), self.create_datetime)
