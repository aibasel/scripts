-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  app.registerUi({["menu"] = "Black", ["callback"] = "runB", ["accelerator"] = "<Alt>B"});
  app.registerUi({["menu"] = "DarkGreen", ["callback"] = "runG", ["accelerator"] = "<Alt>G"});
  app.registerUi({["menu"] = "Red", ["callback"] = "runR", ["accelerator"] = "<Alt>R"});
  app.registerUi({["menu"] = "Magenta", ["callback"] = "runM", ["accelerator"] = "<Alt>M"});
  app.registerUi({["menu"] = "Orange", ["callback"] = "runO", ["accelerator"] = "<Alt>O"});
  app.registerUi({["menu"] = "Yellow", ["callback"] = "runY", ["accelerator"] = "<Alt>Y"});
  app.registerUi({["menu"] = "Yellow", ["callback"] = "runU", ["accelerator"] = "<Alt>U"});
end

-- Callback if the menu item is executed
function runB()
app.changeToolColor({["color"] = 0x000000, ["selection"] = true})
end
function runG()
app.changeToolColor({["color"] = 0x006000, ["selection"] = true})
end
function runR()
app.changeToolColor({["color"] = 0xff0000, ["selection"] = true})
end
function runM()
app.changeToolColor({["color"] = 0xff00ff, ["selection"] = true})
end
function runO()
app.changeToolColor({["color"] = 0xff8800, ["selection"] = true})
end
function runY()
app.changeToolColor({["color"] = 0xffff00, ["selection"] = true})
end
function runU()
app.changeToolColor({["color"] = 0x0031ff, ["selection"] = true})
end
