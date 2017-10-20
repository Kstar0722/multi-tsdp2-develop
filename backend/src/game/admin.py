from django.contrib import admin

from .models import Board, BoardField, Chip, Order


class BoardFieldInlineAdmin(admin.TabularInline):
    model = BoardField
    extra = 1
    fields = [
        'strategy',
        'color',
    ]


@admin.register(Board)
class BoardAdmin(admin.ModelAdmin):
    list_display = [
        'type',
        'user',
        'balance',
    ]
    list_filter = [
        'type',
    ]
    search_fields = [
        'user__username',
    ]
    inlines = [
        BoardFieldInlineAdmin,
    ]


@admin.register(Chip)
class ChipAdmin(admin.ModelAdmin):
    list_display = [
        'board',
        'field',
    ]


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = [
        'board',
        'instrument',
        'signal',
        'chip',
        'type',
        'volume',
        'open_datetime',
        'close_datetime',
    ]
    list_filter = [
        'type',
    ]
    date_hierarchy = 'open_datetime'
