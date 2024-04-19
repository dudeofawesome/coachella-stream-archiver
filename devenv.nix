{ pkgs, lib, config, ... }:
let
  stage-coachella = "https://www.youtube.com/watch?v=iYPwEzMm8i4";
  stage-outdoor-theatre = "https://www.youtube.com/watch?v=M7zW11KC1Nk";
  stage-sahara = "https://www.youtube.com/watch?v=keHf1_peYws";
  stage-mojave = "https://www.youtube.com/watch?v=qwkyHiPoYY4";
  stage-gobi = "https://www.youtube.com/watch?v=GSRtPr96hss";
  stage-yuma = "https://www.youtube.com/watch?v=CN_4koTned0";
in
{
  packages = with pkgs; [
    fish
    ytarchive
  ];

  process-managers.process-compose = {
    enable = true;
    package = pkgs.unstable.process-compose;
  };

  scripts = {
    rip-stream = {
      description = "Generates rendered versions of docs.";
      exec = ''
        dir="out/''$(date +"%Y-%m-%d")/"
        mkdir -p "$dir"
        cd "$dir"

        ytarchive "''$1" '1080p'
      '';
    };
  };

  processes = {
    coachella = {
      exec = "rip-stream '${toString stage-coachella}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
    outdoor-theatre = {
      exec = "rip-stream '${toString stage-outdoor-theatre}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
    sahara = {
      exec = "rip-stream '${toString stage-sahara}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
    mojave = {
      exec = "rip-stream '${toString stage-mojave}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
    gobi = {
      exec = "rip-stream '${toString stage-gobi}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
    yuma = {
      exec = "rip-stream '${toString stage-yuma}'";
      process-compose = {
        availability.restart = "on_failure";
      };
    };
  };

  # enterShell = "devenv up; exit";
}
