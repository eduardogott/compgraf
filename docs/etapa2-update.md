# Etapa 2 — Fluxo de atualização (`update()` de Planet e Moon)

- **Onde `theta` é incrementado:** só em `update()`, com `theta += orbitspeed;` (em `Planet` e em `Moon`).
  A cada quadro o `draw()` chama `planets[i].update()` e depois `planets[i].display()`; `Planet.update()`
  repassa a chamada para as suas luas, então uma lua só avança quando o seu planeta é atualizado.
  `display()` apenas lê `theta`, nunca o altera.
- **Como `orbitspeed` influencia o movimento:** é a velocidade angular em radianos por quadro. Como o
  `display()` faz `rotate(theta)` antes de `translate(distance, 0)`, `theta` é a posição num círculo de raio
  `distance`. Nos planetas, `random(0.01, 0.03)` dá uma volta (2π) a cada ~209 a ~628 quadros
  (cerca de 3,5 a 10,5 s a 60 fps); quanto maior o valor, mais rápida a órbita.
- **Por que a velocidade das luas pode ser positiva ou negativa:** `random(-0.1, 0.1)` sorteia também o sinal.
  No Processing o eixo y aponta para baixo, então `theta` crescente (`orbitspeed > 0`) gira no sentido
  horário na tela e `theta` decrescente (`orbitspeed < 0`) gira no anti-horário. Os planetas só recebem
  valores positivos, por isso todos giram no sentido horário.
- **A lua herda a rotação do planeta:** ela é desenhada dentro do sistema já girado do planeta, então o
  ângulo dela na tela, em volta do planeta, é `theta_planeta + theta_lua`. Uma lua com `-0.01` num planeta
  com `0.02` ainda parece girar devagar no sentido horário; por isso a lua externa do planeta 2 usa `-0.05`,
  que fica negativo somado a qualquer velocidade de planeta (0.01 a 0.03).
- **Com duas luas:** `Planet.update()` percorre o array `moons` e cada lua incrementa apenas o próprio
  `theta`, então as duas luas do planeta 2 andam em ritmos e sentidos diferentes sem afetar uma à outra.
