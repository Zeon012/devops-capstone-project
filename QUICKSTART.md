# Quick Start: Automated Screenshot Capture

## 🚀 Step 1: GitHub Screenshots (Automated)

Run this command to automatically capture 21 GitHub screenshots:

```powershell
.\auto-capture-github.ps1
```

**What it does:**
- Opens each GitHub URL in your browser
- Waits for page to load
- Automatically captures full-screen screenshot
- Saves with correct filename in `screenshots/` folder
- Prompts you to continue to next page

**Time: ~15 minutes** (with pauses to review each capture)

---

## 🔧 Step 2: API & Docker Screenshots (Semi-Automated)

Run this command to test all API endpoints and capture 6 remaining screenshots:

```powershell
.\capture-screenshots.ps1
```

**What it does:**
- Starts Docker container
- Tests each CRUD endpoint
- Shows security headers
- Displays Docker images
- **Pauses after each test** for you to screenshot (Win+Shift+S)
- Tells you the required filename

**Time: ~10 minutes**

---

## 📊 Screenshot Progress

After running both scripts:

✅ **27/30 screenshots** captured automatically or guided  
✅ **2/2 URLs** ready (in SCREENSHOT_FILENAMES.md)  
✅ **1/1 text file** ready (pipelinerun.txt)

### Still need to capture manually:
1. **kube-deploy-accounts.jpg** - K8s deployment (if cluster available)
2. Any screenshots that need adjustment

---

## 🎯 Quick Commands

```powershell
# Run GitHub automation (21 screenshots)
.\auto-capture-github.ps1

# Run API/Docker tests (6 screenshots)
.\capture-screenshots.ps1

# View all captured screenshots
explorer.exe screenshots\

# Check what's still needed
Get-Content SCREENSHOT_FILENAMES.md
```

---

## ⚠️ Important Notes

1. **Maximize your browser** before running auto-capture-github.ps1
2. Script takes **full-screen screenshots** - close unnecessary windows
3. Screenshots are saved as **.jpg** files in `screenshots/` folder
4. You can **press any key** to move to next screenshot
5. If a screenshot looks wrong, you can manually recapture it

---

## 📁 Files

- **auto-capture-github.ps1** - Automated GitHub page screenshots
- **capture-screenshots.ps1** - API/Docker testing with screenshot prompts  
- **pipelinerun.txt** - Tekton pipeline log (ready to submit)
- **SCREENSHOT_FILENAMES.md** - Complete reference guide with all 33 items

---

## ✅ Ready to Start?

```powershell
# Step 1: GitHub screenshots
.\auto-capture-github.ps1

# Step 2: API screenshots  
.\capture-screenshots.ps1

# Step 3: Review
explorer.exe screenshots\
```

Good luck with your submission! 🎉
