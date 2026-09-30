# Etapa 1 — Mapa das transformações (Sol → Planeta → Lua)

Cada seta contínua é "entrar" num nível: `pushMatrix()` seguido das transformações aplicadas
sobre o sistema de coordenadas do nível anterior (a grade se move, não o desenho).
Cada seta tracejada é "sair" dele com `popMatrix()`. Todo corpo é desenhado em `(0, 0)` do seu próprio sistema.

## Diagrama genérico

```mermaid
flowchart TD
    J["Janela<br/>origem (0, 0) no canto superior esquerdo"]
    S["Sol<br/>ellipse(0, 0, 64, 64)"]
    P["Planeta i<br/>ellipse(0, 0, diameter, diameter)"]
    L["Lua de i<br/>ellipse(0, 0, diameter, diameter)"]

    J -->|"draw(): pushMatrix()<br/>translate(width/2, height/2)"| S
    S -->|"Planet.display(): pushMatrix()<br/>1. rotate(theta)<br/>2. translate(distance, 0)"| P
    P -->|"Moon.display(): pushMatrix()<br/>1. rotate(theta)<br/>2. translate(distance, 0)"| L
    L -.->|"popMatrix()"| P
    P -.->|"popMatrix()"| S
    S -.->|"popMatrix()"| J
```

Matriz acumulada que leva o `(0, 0)` da lua até a tela:

```
M_lua = T(width/2, height/2) · R(theta_planeta) · T(distance_planeta, 0) · R(theta_lua) · T(distance_lua, 0)
```

## Nesta implementação (após a Etapa 3)

Cada seta abaixo fica dentro do seu próprio par `pushMatrix()`/`popMatrix()`, então irmãos
(os três planetas; as duas luas do planeta 2) partem sempre do mesmo sistema do pai.

```mermaid
flowchart TD
    S["Sol<br/>translate(width/2, height/2)"]
    S -->|"rotate(θ) → translate(60, 0)"| P0["Planeta 0<br/>laranja, Ø 24"]
    S -->|"rotate(θ) → translate(96, 0)"| P1["Planeta 1<br/>azul, Ø 24"]
    S -->|"rotate(θ) → translate(132, 0)"| P2["Planeta 2<br/>verde, Ø 24"]
    P0 -->|"rotate(θ) → translate(20, 0)"| L0["Lua<br/>Ø 6"]
    P1 -->|"rotate(θ) → translate(24, 0)"| L1["Lua<br/>Ø 10"]
    P2 -->|"rotate(θ) → translate(20, 0)<br/>orbitspeed = 0.09"| L2a["Lua interna<br/>Ø 7"]
    P2 -->|"rotate(θ) → translate(34, 0)<br/>orbitspeed = −0.05"| L2b["Lua externa<br/>Ø 12"]
```
