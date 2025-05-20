c = c
config = config

exceptions = [
        "www.desmos.com",
        "file://*",
        "docs.google.com"
        ]
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
for e in exceptions:
    config.set('colors.webpage.darkmode.enabled', False, e)


config.bind(',d', 'config-cycle colors.webpage.darkmode.enabled true false')

c.tabs.position = "left"

config.load_autoconfig()
config.source("gruvbox.py")
