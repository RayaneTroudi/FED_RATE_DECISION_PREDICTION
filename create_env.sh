#!/bin/bash
# =========================================================
# Script : create_env.sh
# Objectif : Recréer un environnement Python isolé pour le projet FED
# Usage : bash create_env.sh
# =========================================================

cd "$(dirname "$0")"
echo "[INFO] Position actuelle : $(pwd)"

if [ -d ".venv" ]; then
    echo "[INFO] Suppression de l'ancien environnement virtuel..."
    rm -rf .venv
fi

echo "[INFO] Création du nouvel environnement (.venv)..."
python3 -m venv .venv

source .venv/bin/activate
echo "[INFO] Environnement activé."

echo "[INFO] Mise à jour de pip..."
pip install --upgrade pip

if [ -f "requirements.txt" ]; then
    echo "[INFO] Installation des dépendances..."
    pip install -r requirements.txt
else
    echo "[WARN] Aucun fichier requirements.txt trouvé."
fi

# ✅ Étape ajoutée ici
echo "[INFO] Installation du support Jupyter..."
pip install ipykernel jupyter

echo "[INFO] Création du kernel Jupyter 'fed_env'..."
python -m ipykernel install --user --name=fed_env --display-name "Python (fed_env)"

echo "[SUCCESS] Environnement virtuel prêt : 'fed_env'"
