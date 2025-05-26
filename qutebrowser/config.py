c = c
config = config

c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
c.colors.webpage.darkmode.enabled = True
config.set('colors.webpage.preferred_color_scheme', 'dark')

c.content.blocking.enabled = True


exceptions = [
        "www.desmos.com",
        "file://*",
        "docs.google.com",
        "youtube.com"
        ]
for e in exceptions:
    config.set('colors.webpage.darkmode.enabled', False, e)

config.bind(',d', 'config-cycle colors.webpage.darkmode.enabled true false')

c.tabs.position = "left"

config.load_autoconfig()
config.source("gruvbox.py")
