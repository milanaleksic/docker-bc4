# Preconditions

- Verified it works on Ubuntu 15.10 and Debian 8
- Verified it works on Docker 1.9
- your user has to be 1000=uid and 1000=guid (check in `id` if it's so); if not modify the build_image
- If you are not root, `sudo` call demands for you to have `DISPLAY` environment property as inheritable in `/etc/sudoers`