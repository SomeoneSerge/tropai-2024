{ python3Packages, graphviz, mkShell }:

mkShell {
  packages = [
    (python3Packages.python.withPackages (ps: with ps; [
      ipykernel
      notebook
      pyro-ppl
      scipy
      seaborn
      torch
      torchvision
    ]))
    graphviz
  ];
  shellHook = ''
    python3 -m ipykernel install --user --name "tropai-2024" --display-name "Tropcal Probabilistic AI 2024"
  '';
}
