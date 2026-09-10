let
  windows = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAoyDyrTwS+/Sa4lR5SIbs7Pojq3L/YlFAPvgjhLXR0K lorlike@DESKTOP-BMVK2JC";
  wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFLZLrFnSYLl2dqObi9P38WW6NtTJfZPuE6SBYWwBU80 lorlike@nixos";
  systems = [ windows wsl ];
in
{
  "env.age" = {
    publicKeys = systems;
    armor = true;
  };
}
