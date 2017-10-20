# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-04 10:17
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ('strategies', '0003_auto_20170901_1224'),
    ]

    operations = [
        migrations.AlterField(
            model_name='signal',
            name='id',
            field=models.BigAutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='signal',
            name='instrument',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='signals',
                                    to='quotes.Instrument', verbose_name='Instrument'),
        ),
        migrations.AlterField(
            model_name='signal',
            name='strategy',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='signals',
                                    to='strategies.Strategy', verbose_name='Strategy'),
        ),
    ]
