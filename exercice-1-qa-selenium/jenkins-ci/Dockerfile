FROM jenkins/jenkins:lts

USER root

# Installer les dépendances nécessaires à Chrome
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libgbm1 \
    libgtk-3-0 \
    libu2f-udev \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Ajouter la clé Google Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-linux.gpg

# Ajouter le repo Chrome
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
    > /etc/apt/sources.list.d/google-chrome.list

# Installer Chrome
RUN apt-get update && apt-get install -y google-chrome-stable

USER jenkins
