c = c
config = config


c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')
config.set('colors.webpage.darkmode.enabled', False, 'www.desmos.com')

c.tabs.position = "left"

config.load_autoconfig()
config.source("gruvbox.py")
