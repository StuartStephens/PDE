# 📑 Avante Installation Index

## Welcome! 👋

You've successfully installed **Avante** - a powerful AI code assistant for Neovim that integrates with your existing **Copilot Premium** subscription.

## 📖 Documentation Map

Read these in order:

### 1️⃣ **START HERE**: `AVANTE_QUICK_START.md`
   - 5-minute setup
   - Essential keybindings
   - Try it now!
   - Common use cases

### 2️⃣ **Full Setup**: `AVANTE_SETUP.md`
   - Detailed configuration
   - API key setup
   - Project instructions
   - Troubleshooting guide

### 3️⃣ **Status Check**: `INSTALLATION_CHECKLIST.md`
   - What was installed
   - Configuration details
   - Next steps
   - Success criteria

### 4️⃣ **Configuration**: `lua/custom/plugins/avante.lua`
   - The actual plugin config
   - Keybindings
   - Customization options
   - Inline documentation

---

## ⚡ TL;DR - Get Started in 30 Seconds

```bash
# 1. Make sure API key is set
echo $OPENAI_API_KEY

# 2. Open Neovim
nvim

# 3. Press these keys
<leader>at    # Toggle Avante sidebar
v + select    # Select some code  
<leader>aa    # Ask Avante a question
```

---

## 🎯 Main Keybindings

| Shortcut | Action |
|----------|--------|
| `<leader>aa` | **A**sk about code |
| `<leader>ae` | **E**dit with Avante |
| `<leader>at` | **T**oggle sidebar |
| `<leader>ar` | **R**efactor |
| `<leader>ad` | **D**ocument |
| `<leader>af` | **F**ix issues |
| `<leader>ax` | E**X**ecute command |

---

## 🚀 First-Time Setup Checklist

- [ ] Read `AVANTE_QUICK_START.md` (5 min)
- [ ] Check API key: `echo $OPENAI_API_KEY`
- [ ] Open Neovim: `nvim`
- [ ] Press `<leader>at` to toggle sidebar
- [ ] Try `<leader>aa` on some code
- [ ] Run `:checkhealth avante` to verify
- [ ] Read `AVANTE_SETUP.md` for full guide

---

## 🆚 Avante vs OpenCode

**This is important!** You now have TWO AI tools:

### Avante (`<leader>a*`)
- **UI**: Integrated sidebar in Neovim
- **Speed**: Instant, direct LLM access
- **Best for**: Quick edits, refactoring, questions
- **API**: OpenAI (gpt-4o)
- **Cost**: $0.15 per 1M input tokens (gpt-4o)

### OpenCode (`<leader>o*`)
- **UI**: Terminal-based agent interface  
- **Speed**: Slower, but more powerful
- **Best for**: Complex multi-step tasks, MCP tools
- **API**: Your configuration
- **Cost**: Depends on your setup

**Tip**: Use Avante for quick tasks, OpenCode for complex workflows!

---

## ⚙️ Configuration Files

All config in: `/Users/stuartstephens/.config/nvim/`

```
nvim/
├── lua/custom/plugins/
│   ├── avante.lua           ← Avante config (MAIN)
│   ├── opencode.lua         ← OpenCode config (unchanged)
│   └── ...                  ← Other plugins
├── AVANTE_QUICK_START.md    ← Quick reference
├── AVANTE_SETUP.md          ← Full guide
├── INSTALLATION_CHECKLIST.md ← Status
└── AVANTE_INDEX.md          ← This file!
```

---

## 🔑 API Key Setup

Before first use, set your OpenAI API key:

```bash
# Check if set
echo $OPENAI_API_KEY

# Should output something like: sk-...
# If empty, add to ~/.zshrc or ~/.bash_profile

export OPENAI_API_KEY="sk-proj-..."

# Then restart terminal
source ~/.zshrc
```

**Get your key**: https://platform.openai.com/api-keys

---

## 🐛 Troubleshooting

### Sidebar won't appear?
```vim
:checkhealth avante
```
Look for red ✗ and fix any issues listed

### API key errors?
```bash
# Verify it's set correctly
echo $OPENAI_API_KEY
# Should show: sk-...

# If not set, add to ~/.zshrc and restart terminal
```

### Want cheaper models?
Edit `lua/custom/plugins/avante.lua` and change:
```lua
model = 'gpt-4o-mini'  -- Cheaper option
```

### More help?
Read `AVANTE_SETUP.md` → Troubleshooting section

---

## 📊 Monitor Costs

Since you're using your existing Copilot Premium:

1. **Check usage**: https://platform.openai.com/account/billing/usage
2. **Set spending limit**: https://platform.openai.com/account/billing/limits  
3. **Expected costs**: ~$0.15 per 1M input tokens

---

## 🎓 Learn More

- **Avante GitHub**: https://github.com/yetone/avante.nvim
- **OpenAI Models**: https://platform.openai.com/docs/models
- **Copilot Plans**: https://github.com/features/copilot

---

## ✨ Pro Tips

1. **Visual selection**: `v` + select + `<leader>aa` = instant context
2. **Project context**: Create `avante.md` in your project root
3. **Keyboard only**: Use `<Tab>` to navigate between sidebar and code
4. **LSP integration**: Avante sees your diagnostics automatically
5. **Cost saving**: Use `gpt-4o-mini` for routine tasks

---

## 📞 Quick Reference

**Installation status**: ✅ Complete  
**Plugin**: `yetone/avante.nvim`  
**Version**: Latest (auto-updating)  
**API**: OpenAI (Copilot Premium)  
**Keybindings**: `<leader>a*` (zero conflicts)  
**Documentation**: This index + 3 guides  

---

## 🎉 You're All Set!

Next steps:
1. Read `AVANTE_QUICK_START.md`
2. Open Neovim: `nvim`
3. Press `<leader>at` to start
4. Have fun! 🚀

---

**Last updated**: Feb 1, 2025  
**Status**: Ready to use  
**Need help?**: Check troubleshooting in `AVANTE_SETUP.md`
