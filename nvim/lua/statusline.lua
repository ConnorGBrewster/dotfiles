local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local gls = gl.section
local lsp_status = require('lsp-status')

local gruvbox = {
    bg = '#282828',
    fg = '#ebdbb2',
    yellow = '#fabd2f',
    cyan = '#85a598',
    darkblue = '#458588',
    green = '#b8bb26',
    orange = '#f37b19',
    violet = '#b16286',
    magenta = '#d3869b',
    blue = '#8ec07c',
    red = '#fb4934',
};
colors = gruvbox

local function printer(str)
	return function() return str end
end

local space = printer(' ')

gl.short_line_list = {'NvimTree','vista','dbui'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return ' ' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg},
    separator = '',
    separator_highlight = {colors.bg,colors.green},
  }
}
gls.left[4] ={
  FileIcon = {
    provider = {space, 'FileIcon'},
    condition = condition.buffer_not_empty,
    highlight = {colors.bg,colors.green},
    separator = '',
    separator_highlight = {colors.bg,colors.green},
  },
}

gls.left[5] = {
  FileName = {
    provider = {space, 'FileName'},
    separator = ' ',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'},
    separator_highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    separator = '',
    condition = condition.buffer_not_empty,
    highlight = {colors.blue,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
    LspStatus = {
        provider = function()
            return lsp_status.status()
        end,
        highlight = {colors.green,colors.bg,'bold'}
    }
}

gls.right[2] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[3] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  GitBranch = {
    provider = {space,'GitBranch'},
    condition = condition.check_git_workspace,
    highlight = {colors.bg,colors.violet,'bold'},
    separator = '',
    separator_highlight = {colors.bg,colors.violet,'bold'},
  }
}

gls.right[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
    separator = '',
    separator_highlight = {colors.bg,colors.violet,'bold'},
  }
}
gls.right[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[9] = {
  RainbowBlue = {
    provider = function() return '  ' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
