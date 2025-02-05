{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_18  # Use the latest Node.js LTS
    pkgs.yarn       # Optional, if you prefer Yarn
    pkgs.git        # Needed for npm dependencies that use Git
  ];

  shellHook = ''
    npm install @graphlab-fr/cosma
    alias cosma="../node_modules/.bin/cosma"
    python -m venv venv
    source venv/bin/activate
    python3 obsidian2cosma.py -i assignment/ -o ./cosma
    cd cosma
    cosma c
  '';
}
