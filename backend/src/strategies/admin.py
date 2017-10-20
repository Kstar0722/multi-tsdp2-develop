from django.contrib import admin

from .models import Strategy, Signal


@admin.register(Strategy)
class StrategyAdmin(admin.ModelAdmin):
    list_display = [
        'name',
    ]
    search_fields = ('name',)


@admin.register(Signal)
class SignalAdmin(admin.ModelAdmin):
    list_display = [
        'strategy',
        'instrument',
        'type',
        'create_datetime',
    ]
    list_filter = [
        'type',
        'strategy',
        'instrument',
    ]
    date_hierarchy = 'create_datetime'
