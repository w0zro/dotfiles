Phoenix.set({
  daemon: true,
  openAtLogin: true,
})

const MODIFIERS = ["cmd", "ctrl"];
const SMODIFIERS = ["cmd", "ctrl", "shift"];
const PADDING = 30;

function centerWindowInFrame(window, targetFrame) {
  const windowFrame = window.frame(),
    targetFrameCenter = {
      x: targetFrame.x + targetFrame.width / 2,
      y: targetFrame.y + targetFrame.height / 2,
    };
  window.setTopLeft({
    x: targetFrameCenter.x - windowFrame.width / 2,
    y: targetFrameCenter.y - windowFrame.height / 2,
  });
}

function maximizeWindowInFrame(window, targetFrame) {
  window.setFrame(targetFrame);
}

function windowFitsInFrame(window, targetFrame) {
  const windowFrame = window.frame();
  return (
    windowFrame.width <= targetFrame.width &&
    windowFrame.height <= targetFrame.height
  );
}

function frameOfNextScreen(window) {
  if (!window || !window.screen().next()) {
    return;
  }
  return window.screen().next().flippedVisibleFrame();
}


Key.on('r', MODIFIERS, function() {
  Phoenix.reload();
});

Key.on("c", MODIFIERS, function () {
  const window = Window.focused(),
    nextScreenFrame = window.screen().flippedVisibleFrame();
  centerWindowInFrame(window, nextScreenFrame);
});

Key.on("o", MODIFIERS, function () {
  const window = Window.focused();
  const nextScreenFrame = frameOfNextScreen(window);
  if (!window || !nextScreenFrame) {
    return;
  }
  if (windowFitsInFrame(window, nextScreenFrame)) {
    centerWindowInFrame(window, nextScreenFrame);
  } else {
    maximizeWindowInFrame(window, nextScreenFrame);
  }
});

Key.on("space", MODIFIERS, function () {
  const window = Window.focused();
  const screen = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screen.x + PADDING,
    y: screen.y + PADDING,
    width: screen.width - PADDING*2,
    height: screen.height - PADDING*2
  });
});

Key.on("space", SMODIFIERS, function () {
  Window.focused().maximize();
});

Key.on("h", MODIFIERS, function () {
  const window = Window.focused();
  const screen = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screen.x + PADDING,
    y: screen.y + PADDING,
    width: (screen.width / 2) - PADDING,
    height: screen.height - PADDING*2
  });
});

Key.on("h", SMODIFIERS, function () {
  const window = Window.focused();
  const screen = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screen.x,
    y: screen.y,
    width: screen.width / 2,
    height: screen.height
  });
});

Key.on("l", MODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x + screenFrame.width / 2,
    y: screenFrame.y + PADDING,
    width: (screenFrame.width / 2) - PADDING,
    height: screenFrame.height - PADDING*2,
  });
});

Key.on("l", SMODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x + screenFrame.width / 2,
    y: screenFrame.y,
    width: screenFrame.width / 2,
    height: screenFrame.height,
  });
});

Key.on("k", MODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x + PADDING,
    y: screenFrame.y + PADDING,
    width: screenFrame.width - PADDING*2,
    height: (screenFrame.height / 2) - PADDING,
  });
});

Key.on("k", SMODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y,
    width: screenFrame.width,
    height: screenFrame.height / 2,
  });
});

Key.on("j", MODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x + PADDING,
    y: screenFrame.y + screenFrame.height / 2,
    width: screenFrame.width - PADDING*2,
    height: (screenFrame.height / 2) - PADDING,
  });
});

Key.on("j", SMODIFIERS, function () {
  const window = Window.focused();
  const screenFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: screenFrame.x,
    y: screenFrame.y + screenFrame.height / 2,
    width: screenFrame.width,
    height: screenFrame.height / 2,
  });
});
