{ pkgs, lib, inputs, ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      toggle_fps_limit = "F1";
      legacy_layout = false;
      gpu_stats = true;
      gpu_temp = true;
      gpu_load_change = true;  # Fix here
      gpu_load_value = [50 90];  # Fix here
      gpu_load_color = ["FFFFFF" "FF7800" "CC0000"];  # Fix here
      gpu_text = "GPU";
      cpu_stats = true;
      cpu_temp = true;
      cpu_load_change = true;  # Fix here
      core_load_change = true;  # Fix here
      cpu_load_value = [50 90];  # Fix here
      cpu_load_color = ["FFFFFF" "FF7800" "CC0000"];  # Fix here
      cpu_text = "CPU";
      io_color = "a491d3";
      vram = true;
      vram_color = "ad64c1";
      ram = true;
      ram_color = "c26693";
      media_player_color = "ffffff";
      background_alpha = 0.4;
      font_size = 24;
      background_color = "020202";
      position = "top-left";
      text_color = "ffffff";
      round_corners = 0;
      toggle_hud = "Shift_R+F12";
      toggle_logging = "Shift_L+F2";
      upload_log = "F5";
      output_folder = "/home/tht";
      media_player_name = "spotify";
      fps = true;
      engine_color = "eb5b5b";
      wine_color = "eb5b5b";
      frame_timing = 1;
    };
  };
}
