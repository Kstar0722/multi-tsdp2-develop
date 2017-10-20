# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-04 13:25
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ('game', '0003_auto_20170904_1115'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order',
            old_name='signals',
            new_name='signal',
        ),
        migrations.RemoveField(
            model_name='chip',
            name='fields',
        ),
        migrations.AddField(
            model_name='chip',
            name='field',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE,
                                    related_name='chips', to='game.BoardField', verbose_name='Board field'),
        ),
        migrations.AlterField(
            model_name='board',
            name='balance',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='balance'),
        ),
        migrations.AlterField(
            model_name='boardfield',
            name='color',
            field=models.CharField(max_length=6, verbose_name='color'),
        ),
        migrations.AlterField(
            model_name='order',
            name='close_datetime',
            field=models.DateTimeField(blank=True, null=True, verbose_name='close datetime'),
        ),
        migrations.AlterField(
            model_name='order',
            name='open_datetime',
            field=models.DateTimeField(verbose_name='open datetime'),
        ),
    ]