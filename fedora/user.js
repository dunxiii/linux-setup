// Disable youtube fullscreen animation
user_pref("full-screen-api.transition-duration.enter", 0);
user_pref("full-screen-api.transition-duration.leave", 0);
user_pref("full-screen-api.transition.timeout", 0);
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// Disable F11 animation
user_pref("toolkit.cosmeticAnimations.enabled", false);

// Allways let me choose where to download files
user_pref("browser.download.useDownloadDir", false);

// Make vsync work on fullscreen video
user_pref("layers.acceleration.force-enabled", true);

// Enable WebRender
user_pref("gfx.webrender.all", true);

// Firefox never asks to save passwords
user_pref("signon.rememberSignons", true);
