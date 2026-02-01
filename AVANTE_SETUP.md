# Avante Setup Guide

## ✅ Installation Complete

Avante has been installed and configured to use your existing **Copilot Premium** subscription (OpenAI API).

## 🔑 Configuration

Your Avante setup is configured to:
- **Provider**: Copilot (OpenAI - using your existing subscription)
- **Model**: gpt-4o
- **UI**: Native Neovim sidebar on the right
- **Dependencies**: Uses existing telescope, fzf-lua, snacks.nvim

## ⌨️ Keybindings

All Avante commands use the `<leader>a` prefix:

| Keybinding | Action |
|------------|--------|
| `<leader>aa` | **A**sk Avante about code (selection or cursor) |
| `<leader>ae` | **E**dit with Avante |
| `<leader>at` | **T**oggle Avante sidebar |
| `<leader>ar` | **R**efactor code |
| `<leader>ax` | E**X**ecute slash command (e.g., `/code`, `/debug`) |
| `<leader>ad` | **D**ocument code |
| `<leader>af` | **F**ix code issues |

## 🚀 First Use

1. **Open Neovim** - Avante will be automatically loaded
2. **First time setup** - If you haven't set your OpenAI API key, Avante will prompt you
3. **Test it**:
   - Select some code in visual mode: `v` + select code
   - Press `<leader>aa` to ask Avante about it
   - Or press `<leader>at` to toggle the sidebar

## 🔐 API Key Setup

Your existing `OPENAI_API_KEY` environment variable is used. If not set:

1. Get your API key from https://platform.openai.com/api-keys
2. Add to your shell profile (`~/.zshrc` or `~/.bash_profile`):
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   ```
3. Restart your terminal or run: `source ~/.zshrc`

## 📝 Project Instructions (Optional)

Create an `avante.md` file in your project root to give Avante project-specific context:

```markdown
# Project Instructions

## Your Role
You are an expert developer specializing in [your tech stack].

## Your Mission
Help build and maintain [project description].

## Tech Stack
- Frontend: [your frontend tech]
- Backend: [your backend tech]
- Testing: [your testing framework]

## Code Standards
- Use [your coding style]
- Follow [your project's patterns]
- Prioritize [performance/readability/etc]
```

## 🎯 Workflow Tips

### Quick Ask About Code
```
1. Place cursor on code
2. Press <leader>aa
3. Type your question
4. Press Enter
```

### Visual Selection
```
1. Select code: v + arrow keys
2. Press <leader>aa or <leader>ar
3. Ask your question
```

### Toggle Sidebar
```
Press <leader>at to toggle the sidebar on/off
Use <Tab> to switch between Avante and your code
```

## 🔄 Comparing with OpenCode

You now have both tools:

| Tool | Best For |
|------|----------|
| **OpenCode** (`<leader>o*`) | Agent-orchestrated complex tasks, multi-step coding |
| **Avante** (`<leader>a*`) | Quick focused edits, refactoring, inline suggestions |

## ❓ Troubleshooting

### Avante not working?
- Run `:checkhealth avante` in Neovim
- Verify `OPENAI_API_KEY` is set: `echo $OPENAI_API_KEY`
- Restart Neovim

### API errors?
- Check your API key is valid at https://platform.openai.com/api-keys
- Verify you have API credits/quota available
- Check OpenAI status: https://status.openai.com

### Sidebar not appearing?
- Try `:lua require('avante.api').toggle()` manually
- Check dependencies are installed: `:checkhealth avante`

## 📚 More Resources

- **Avante Docs**: https://github.com/yetone/avante.nvim
- **Copilot Premium**: Verify you're on a paid plan at https://github.com/account/billing/overview
- **OpenAI Docs**: https://platform.openai.com/docs

## Next Steps

1. ✅ Plugin installed - you're here!
2. 🚀 **Try Avante** on a real coding task
3. 📊 Compare with OpenCode to find your workflow
4. 🎯 Customize keybindings if needed (edit `/lua/custom/plugins/avante.lua`)
5. 💡 Create `avante.md` for better context

Happy coding! 🎉
