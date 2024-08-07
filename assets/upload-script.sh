#!/bin/zsh

# Verzeichnis des Projekts wechseln
cd ..

# Sicherstellen, dass wir den neuesten Stand des remote Repos haben
git fetch origin

# Überprüfen, ob der main Branch existiert und lösche ihn lokal, falls ja
if git show-ref --verify --quiet refs/heads/main; then
  git branch -D main
fi

# Orphan-Branch erstellen (ohne Historie)
git checkout --orphan main

# Alle Dateien hinzufügen und committen
git add -A
git commit -m "Initial commit for GitHub Pages"

# Entferne das bestehende Remote-Repository und füge es neu hinzu
git remote remove origin
git remote add origin git@github.com:talionderhobbit/christianottenhaus.git

# Force Push zu main und überschreibe die Historie
git push -u -f origin main

# Optional: Backup der vollständigen Historie erstellen
# Überprüfe, ob das Backup-Verzeichnis existiert, und lösche es, falls ja
if [ -d ~/backup-repo ]; then
  rm -rf ~/backup-repo
fi

mkdir -p ~/backup-repo
cd ~
git clone --mirror git@github.com:talionderhobbit/christianottenhaus.git ~/backup-repo
cd ~/backup-repo
git remote set-url origin git@github.com:talionderhobbit/portfolio-private.git
git push --mirror