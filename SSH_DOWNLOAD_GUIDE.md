# 🔧 SSH Download Guide - Zathaya Soft Website Files

## 📋 Methods untuk Download Files via SSH

### **Method 1: SCP (Secure Copy Protocol) - RECOMMENDED**

```bash
# Basic SCP command structure:
scp [options] username@hostname:/path/to/remote/file /path/to/local/destination

# Download single file:
scp username@server:/vercel/sandbox/zathaya-soft-complete.tar.gz ~/Downloads/

# Download with specific port:
scp -P 22 username@server:/path/to/file ~/Downloads/

# Download with verbose output:
scp -v username@server:/path/to/file ~/Downloads/
```

### **Method 2: SFTP (SSH File Transfer Protocol)**

```bash
# Start SFTP session:
sftp username@server

# Navigate and download:
sftp> pwd                                    # Check current directory
sftp> ls                                     # List files
sftp> cd /vercel/sandbox                     # Navigate to file location
sftp> ls -la                                 # List files with details
sftp> get zathaya-soft-complete.tar.gz       # Download file
sftp> lcd ~/Downloads                        # Change local directory
sftp> get zathaya-soft-complete.tar.gz       # Download to new location
sftp> quit                                   # Exit SFTP
```

### **Method 3: RSYNC (Robust Sync)**

```bash
# Basic rsync with progress:
rsync -avz --progress username@server:/path/to/file ~/Downloads/

# Rsync with compression:
rsync -avz --compress username@server:/path/to/file ~/Downloads/

# Resume interrupted downloads:
rsync -avz --partial --progress username@server:/path/to/file ~/Downloads/
```

### **Method 4: wget/curl (if HTTP endpoint available)**

```bash
# If file accessible via HTTP:
wget https://server-url/path/to/zathaya-soft-complete.tar.gz

# Using curl:
curl -O https://server-url/path/to/zathaya-soft-complete.tar.gz

# With progress bar:
curl --progress-bar -O https://server-url/path/to/file.tar.gz
```

### **Method 5: Base64 Encoding (Small files)**

**On Server:**
```bash
# Encode file to base64:
base64 -w 0 zathaya-soft-complete.tar.gz > encoded_file.txt

# Split large base64 into chunks:
base64 -w 0 zathaya-soft-complete.tar.gz | split -b 1000 - chunk_

# Display file content (copy-paste method):
cat encoded_file.txt
```

**On Local Machine:**
```bash
# Decode base64 back to file:
base64 -d encoded_file.txt > zathaya-soft-complete.tar.gz

# Or if using chunks:
cat chunk_* > encoded_file.txt
base64 -d encoded_file.txt > zathaya-soft-complete.tar.gz
```

### **Method 6: tar + SSH Pipeline**

```bash
# Create and download archive in one command:
ssh username@server 'cd /vercel/sandbox && tar czf - zathaya-soft-source/' > local-copy.tar.gz

# Extract directly:
ssh username@server 'cd /vercel/sandbox && tar czf - zathaya-soft-source/' | tar xzf -
```

## 🔍 Connection Information

**Untuk Vercel Sandbox (jika menggunakan SSH):**

```bash
# General format:
scp username@sb-[sandbox-id].vercel.run:/vercel/sandbox/filename ./
```

## 🔧 Troubleshooting SSH Download

### **1. Permission Issues:**
```bash
# Add SSH key:
ssh-add ~/.ssh/id_rsa

# Test connection:
ssh -v username@server

# Use specific key:
scp -i ~/.ssh/custom_key username@server:/path/to/file ./
```

### **2. Connection Timeout:**
```bash
# Use compression for slow connections:
scp -C username@server:/path/to/file ./

# Set connection timeout:
scp -o ConnectTimeout=30 username@server:/path/to/file ./
```

### **3. Large File Downloads:**
```bash
# Resume interrupted download with rsync:
rsync -avz --partial --progress username@server:/path/to/file ./

# Split download into chunks:
split -b 10M large_file.tar.gz chunk_
```

### **4. Multiple Files:**
```bash
# Download entire directory:
scp -r username@server:/path/to/directory/ ./

# Download multiple files:
scp username@server:"/path/to/{file1,file2,file3}" ./
```

## 📁 Alternative: Manual File Access

**If SSH is not available, you can:**

1. **Access via file manager** (if available in sandbox)
2. **Use web-based terminal** to display file contents
3. **Create smaller chunks** and copy-paste manually
4. **Use cloud storage** (upload to Google Drive, Dropbox, etc.)

### **Cloud Upload Method:**
```bash
# Upload to temporary cloud storage (if available):
curl -F "file=@zathaya-soft-complete.tar.gz" https://file.io/

# Or use rclone (if configured):
rclone copy zathaya-soft-complete.tar.gz remote:folder/
```

## 🎯 Specific for This Project

**Files to download:**
- `zathaya-soft-complete.tar.gz` (Complete package)
- `DRUPAL_CONVERSION_GUIDE.md` (Conversion instructions)
- Individual source files from `zathaya-soft-source/` directory

**File sizes:**
- Complete archive: ~67 KB (compressed)
- Individual files: Various sizes
- Total uncompressed: ~2-3 MB

## 📞 Quick Commands Reference

```bash
# Quick download (replace with actual server details):
scp user@server:/vercel/sandbox/zathaya-soft-complete.tar.gz ./

# Verify download:
ls -la zathaya-soft-complete.tar.gz

# Extract:
tar -xzf zathaya-soft-complete.tar.gz

# List contents:
tar -tzf zathaya-soft-complete.tar.gz
```

---

**Note:** Ganti `username`, `server`, dan path sesuai dengan detail koneksi SSH sandbox Anda yang actual.