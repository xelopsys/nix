# reference: https://maksar.github.io/posts/code/2021-09-19-vscode/
{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions;
        [
          ecmel.vscode-html-css
          ms-vscode-remote.vscode-remote-extensionpack
          ms-vscode-remote.remote-ssh
          ms-python.black-formatter
          rust-lang.rust-analyzer
          streetsidesoftware.code-spell-checker
          bradlc.vscode-tailwindcss
          esbenp.prettier-vscode
          dbaeumer.vscode-eslint
          formulahendry.auto-rename-tag
          formulahendry.auto-close-tag
          kamadorueda.alejandra
          bbenoist.nix
          jnoortheen.nix-ide
          eamodio.gitlens
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "preparing";
            publisher = "Thomaz";
            version = "1.7.0";
            sha256 = "sha256-P4GzDDNnikLxaPKWSevaZPGgvsVHM0HeMRUaIWWIPo4=";
          }
          {
            name = "tsimporter";
            publisher = "pmneo";
            version = "2.0.1";
            sha256 = "sha256-JQ7dAliryvVXH0Rg1uheSznOHqbp/BMwwlePH9P0kog=";
          }
          {
            name = "pretty-ts-errors";
            publisher = "YoavBls";
            version = "0.7.0";
            sha256 = "sha256-+PKxy1YN8ZP0hstb7PXZH+5L4n2l/j5J9/ordS2cBYM=";
          }
          {
            name = "vs-code-prettier-eslint";
            publisher = "rvest";
            version = "6.0.0";
            sha256 = "sha256-PogNeKhIlcGxUKrW5gHvFhNluUelWDGHCdg5K+xGXJY=";
          }
          {
            name = "path-autocomplete";
            publisher = "ionutvmi";
            version = "1.25.0";
            sha256 = "sha256-iz32o1znwKpbJSdrDYf+GDPC++uGvsCdUuGaQu6AWEo=";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "5.31.0";
            sha256 = "sha256-B2+yaKX/nhBLdeFDffwt4CmeWo+Jr4oMxcWBEaAhRtg=";
          }
          {
            name = "es7-react-js-snippets";
            publisher = "dsznajder";
            version = "4.4.3";
            sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
          }
          {
            name = "vscode-extension-auto-import";
            publisher = "NuclleaR";
            version = "1.4.3";
            sha256 = "sha256-e6v3+SZ0NT9fEBkg2LdhrsyVsnQIoZtjeSQsxELE4ic=";
          }
          {
            name = "vscode-extension-auto-import";
            publisher = "moppitz";
            version = "1.3.3";
            sha256 = "sha256-5jMwF8U7G2HrCy++zPCBtPKvlCOzBT22I8n0CCwFOn0=";
          }
          {
            name = "autoimport";
            publisher = "steoates";
            version = "1.5.4";
            sha256 = "sha256-7iIwJJsoNbtTopc+BQ+195aSCLqdNAaGtMoxShyhBWY=";
          }
        ];

      # Keybindings for copying line down and up
      keybindings = [
        {
          key = "shift+alt+down";
          command = "editor.action.copyLinesDownAction";
        }
        {
          key = "shift+alt+up";
          command = "editor.action.copyLinesUpAction";
        }
      ];

      userSettings = {
        # "files.autoSave" = "afterDelay";

        "[python]"."editor.tabSize" = 4;
        "editor.fontSize" = 14;
        "terminal.integrated.fontSize" = 14;
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
        "terminal.integrated.profiles.osx" = {
          "fish (nix)" = {
            path = "/run/current-system/sw/bin/fish";
          };
        };
        "files.associations" = {
          "*.dump-simpl" = "haskell";
          "*.dump-ds" = "haskell";
          "*.project.local" = "haskell";
        };
        "files.exclude" = {
          "**/.DS_Store" = true;
          "**/.git" = true;
          "**/.hg" = true;
          "**/.lsp" = true;
          "**/.svn" = true;
          "**/.idea" = true;
          "**/CVS" = true;
          "**/Thumbs.db" = true;
        };
        "terminal.integrated.defaultProfile.osx" = "fish";
        "terminal.integrated.defaultProfile.linux" = "fish";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "NarutoDark";
        "diffEditor.ignoreTrimWhitespace" = false;
        "vsicons.dontShowNewVersionMessage" = true;
        "liveServer.settings.donotShowInfoMsg" = true;
        "explorer.fileNesting.patterns" = {
          "*.ts" = "\${capture}.js";
          "*.js" = "\${capture}.js.map, \${capture}.min.js, \${capture}.d.ts";
          "*.jsx" = "\${capture}.js";
          "*.tsx" = "\${capture}.ts";
          "tsconfig.json" = "tsconfig.*.json";
          "package.json" = "package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lockb";
          "*.sqlite" = "\${capture}.\${extname}-*";
          "*.db" = "\${capture}.\${extname}-*";
          "*.sqlite3" = "\${capture}.\${extname}-*";
          "*.db3" = "\${capture}.\${extname}-*";
          "*.sdb" = "\${capture}.\${extname}-*";
          "*.s3db" = "\${capture}.\${extname}-*";
        };
        "terminal.integrated.inheritEnv" = false;
        "editor.accessibilitySupport" = "off";
        "remote.SSH.configFile" = "~/.ssh/id_ed25519";
        "extensions.ignoreRecommendations" = true;
        "terminal.integrated.suggest" = false;

        # Language-specific settings
        "[css]" = {
          "editor.defaultFormatter" = "css-language-features";
        };
        "[html]" = {
          "editor.defaultFormatter" = "NikolaosGeorgiou.html-fmt-vscode";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "typescript-language-features";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "typescript-language-features";
        };
        "[jsonc]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
        };
        "[python]" = {
          "diffEditor.ignoreTrimWhitespace" = false;
          "editor.defaultColorDecorators" = "never";
          "gitlens.codeLens.symbolScopes" = ["!Module"];
          "editor.formatOnType" = true;
          "editor.wordBasedSuggestions" = "off";
        };
        "mesonbuild.configureOnOpen" = false;
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = true;
          "markdown" = true;
          "scminput" = true;
          "nix" = false;
        };
        "[nix]" = {
          "editor.tabSize" = 2;
          "editor.defaultFormatter" = "kamadorueda.alejandra";
          "editor.formatOnPaste" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnType" = false;
        };
        "alejandra.program" = "alejandra";
        "nix" = {
          "enableLanguageServer" = true;
          "serverPath" = "nixd";
          "formatterPath" = "alejandra";
          "serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [
                  "alejandra"
                ];
              };
              # "options" = {
              #   "nixos" = {
              #     "expr" = "(builtins.getFlake \"/absolute/path/to/flake\").nixosConfigurations.<name>.options";
              #   };
              #   "home-manager" = {
              #     "expr" = "(builtins.getFlake \"/absolute/path/to/flake\").homeConfigurations.<name>.options";
              #   };
              #   "nix-darwin" = {
              #     "expr" = "(builtins.getFlake \"$\{workspaceFolder}/path/to/flake\").darwinConfigurations.<name>.options";
              #   };
              # };
            };
          };
        };
      };
    };
  };
}
