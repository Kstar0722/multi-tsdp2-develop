"""tsdp URL Configuration"""
from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic import TemplateView

urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='index.html'), name='index'),
    url(r'^accounts/', include('registration.backends.hmac.urls')),
    url(r'^admin/', admin.site.urls),
]

if settings.DEBUG:
    try:
        import debug_toolbar  # noqa: F401

        urlpatterns = [
            url(r'^__debug__/', include(debug_toolbar.urls)),
        ] + urlpatterns

    except ImportError:
        pass
