# 🚀 Avante Quick Start

## ✅ You're All Set!

Avante has been successfully installed and configured for your Neovim setup.

## What You Get

- **Native Neovim Integration**: No more switching to terminal
- **Copilot Premium Powered**: Uses your existing OpenAI API key
- **Instant Access**: Press `<leader>at` to toggle the sidebar
- **Full Context**: Works with your selected code, open buffers, and diagnostics

## 🎯 Try It Now (5 seconds)

1. Open Neovim: `nvim`
2. Open a code file
3. Press: `<leader>at` (toggle Avante sidebar)
4. Select some code with `v` key
5. Press: `<leader>aa` (ask Avante)
6. Type your question and press Enter!

## 📋 Main Commands

**Basic Workflow:**
```
<leader>aa  = Ask about selected code
<leader>ae  = Edit/apply Avante suggestions
<leader>at  = Toggle sidebar (on/off)
```

**Advanced Tasks:**
```
<leader>ar  = Refactor code
<leader>ad  = Add documentation
<leader>af  = Fix issues/bugs
<leader>ax  = Use slash commands (e.g., /debug, /analyze)
```

## 💡 Common Use Cases

### Quick Question
```
1. Select function: v + select lines
2. Press <leader>aa
3. Ask: "What does this do?"
4. Read response in sidebar
```

### Refactor Code
```
1. Place cursor on code
2. Press <leader>ar
3. Avante suggests improvements
4. Press 'a' to apply or review changes
```

### Get Documentation
```
1. Select function
2. Press <leader>ad
3. Avante generates comments
4. Review and apply with 'a' key
```

### Use Your Project Context
- Create `avante.md` in your project root
- Avante will automatically use it for context
- Example: Tell it your tech stack, coding standards, etc.

## 🔑 Important: Set Your API Key

Before first use, make sure your OpenAI API key is set:

```bash
# Check if it's set:
echo $OPENAI_API_KEY

# If empty, add to ~/.zshrc or ~/.bash_profile:
export OPENAI_API_KEY="sk-..."

# Then restart terminal or:
source ~/.zshrc
```

## 🎮 Sidebar Navigation

Once `<leader>at` opens the sidebar:

| Key | Action |
|-----|--------|
| `<Tab>` | Switch between Avante and code |
| `<S-Tab>` | Switch back |
| `a` | Apply suggestion |
| `A` | Apply all suggestions |
| Arrow keys | Navigate responses |
| `i` | Enter insert mode to edit prompt |

## 🐛 Something Not Working?

1. **Sidebar won't appear?**
   ```vim
   :checkhealth avante
   ```
   Check for red X marks and fix any issues

2. **API errors?**
   - Verify key: `echo $OPENAI_API_KEY` should show `sk-...`
   - Check balance: https://platform.openai.com/account/billing/overview
   - Restart Neovim after setting the key

3. **Need to change model?**
   - Edit: `/Users/stuartstephens/.config/nvim/lua/custom/plugins/avante.lua`
   - Find line with `model = 'gpt-4o'`
   - Change to `'gpt-4o-mini'` for cheaper option

## 🆚 Compare with OpenCode

You now have TWO AI tools:

**OpenCode** (`<leader>o*`):
- Agent-based orchestration
- Best for: Complex, multi-step tasks
- Terminal UI in a split
- Access to MCP tools

**Avante** (`<leader>a*`):
- Direct LLM access
- Best for: Quick edits, refactoring
- Integrated sidebar
- Fast and focused

Use whichever feels right for each task!

## 📊 Monitor Your Costs

Both tools use OpenAI API, so costs add up:
- Check usage: https://platform.openai.com/account/billing/usage
- Set spending limit: https://platform.openai.com/account/billing/limits

## 🎓 Learn More

- Full guide: Read `AVANTE_SETUP.md` in your nvim config directory
- Avante docs: https://github.com/yetone/avante.nvim
- OpenAI models: https://platform.openai.com/docs/models

## ✨ Tips & Tricks

1. **With selections**: Visual mode (`v`) + select + `<leader>aa` = instant context
2. **Multi-file**: Avante can see your whole open buffer context
3. **Diagnostics**: Avante can see LSP errors - use it to fix them
4. **Project instructions**: Create `avante.md` with your standards
5. **Keyboard only**: Everything works without mouse (vim-native)

---

**You're ready to go! 🎉**

Try it now: Open Neovim and press `<leader>at`

Questions? Check `AVANTE_SETUP.md` for troubleshooting.
