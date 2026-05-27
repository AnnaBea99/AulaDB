**Query #1**

    -- ============================================================
    -- RESUMO DA ORDEM DE EXECUÇÃO SQL
    -- ============================================================
    --  1. FROM / JOIN   → monta a "tabela virtual" com os dados unidos
    --  2. WHERE         → filtra linhas ANTES de agrupar
    --  3. GROUP BY      → agrupa as linhas restantes
    --  4. HAVING        → filtra os GRUPOS (resultados agregados)
    --  5. SELECT        → escolhe as colunas a exibir
    --  6. ORDER BY      → ordena o resultado final
    --  7. LIMIT         → limita a quantidade de linhas retornadas
    -- ============================================================
    use Cafeteria;

There are no results to be displayed.

---
**Query #2**

    -- ==============================================================
    -- PARTE 1 — O PROBLEMA: por que precisamos de JOIN?
    -- ==============================================================
    
    -- TENTATIVA ERRADA: olhar apenas UMA tabela
    -- Isso mostra só o ID do cliente — não sabemos quem é.
    SELECT id, idcliente, status
    FROM pedidos;

| id  | idcliente | status       |
| --- | --------- | ------------ |
| 1   | 10        | Em Andamento |
| 2   | 3         | ConcluÃ­do   |
| 3   | 8         | Entregue     |
| 4   | 14        | Em Andamento |
| 5   | 7         | ConcluÃ­do   |
| 6   | 1         | Entregue     |
| 7   | 25        | Em Andamento |
| 8   | 9         | ConcluÃ­do   |
| 9   | 12        | Entregue     |
| 10  | 26        | Em Andamento |
| 11  | 4         | ConcluÃ­do   |
| 12  | 5         | Em Andamento |
| 13  | 22        | ConcluÃ­do   |
| 14  | 18        | Entregue     |
| 15  | 19        | Em Andamento |
| 16  | 15        | ConcluÃ­do   |
| 17  | 20        | Entregue     |
| 18  | 13        | Em Andamento |
| 19  | 23        | ConcluÃ­do   |
| 20  | 2         | Entregue     |
| 21  | 6         | Em Andamento |
| 22  | 11        | ConcluÃ­do   |
| 23  | 21        | Entregue     |
| 24  | 16        | Em Andamento |
| 25  | 24        | ConcluÃ­do   |
| 26  | 17        | Entregue     |
| 27  | 8         | Em Andamento |
| 28  | 12        | ConcluÃ­do   |
| 29  | 2         | Entregue     |
| 30  | 16        | Em Andamento |
| 31  | 25        | ConcluÃ­do   |
| 32  | 7         | Entregue     |
| 33  | 10        | Em Andamento |
| 34  | 4         | ConcluÃ­do   |
| 35  | 11        | Entregue     |
| 36  | 15        | Em Andamento |
| 37  | 26        | ConcluÃ­do   |
| 38  | 3         | Entregue     |
| 39  | 18        | Em Andamento |
| 40  | 20        | ConcluÃ­do   |
| 41  | 21        | Entregue     |
| 42  | 13        | Em Andamento |
| 43  | 9         | ConcluÃ­do   |
| 44  | 5         | Entregue     |
| 45  | 19        | Em Andamento |
| 46  | 22        | ConcluÃ­do   |
| 47  | 24        | Entregue     |
| 48  | 1         | Em Andamento |
| 49  | 23        | ConcluÃ­do   |
| 50  | 6         | Entregue     |
| 51  | 8         | Em Andamento |
| 52  | 10        | ConcluÃ­do   |
| 53  | 4         | Entregue     |
| 54  | 2         | Em Andamento |
| 55  | 16        | ConcluÃ­do   |
| 56  | 12        | Entregue     |
| 57  | 26        | Em Andamento |
| 58  | 5         | ConcluÃ­do   |
| 59  | 9         | Entregue     |
| 60  | 18        | Em Andamento |
| 61  | 1         | ConcluÃ­do   |
| 62  | 22        | Entregue     |
| 63  | 15        | Em Andamento |
| 64  | 19        | ConcluÃ­do   |
| 65  | 21        | Entregue     |
| 66  | 7         | Em Andamento |
| 67  | 11        | ConcluÃ­do   |
| 68  | 13        | Entregue     |
| 69  | 3         | Em Andamento |
| 70  | 24        | ConcluÃ­do   |
| 71  | 17        | Entregue     |
| 72  | 23        | Em Andamento |
| 73  | 6         | ConcluÃ­do   |
| 74  | 20        | Entregue     |
| 75  | 14        | Em Andamento |
| 76  | 25        | ConcluÃ­do   |
| 77  | 8         | Em Andamento |
| 78  | 10        | ConcluÃ­do   |
| 79  | 4         | Entregue     |
| 80  | 2         | Em Andamento |
| 81  | 16        | ConcluÃ­do   |
| 82  | 12        | Entregue     |
| 83  | 26        | Em Andamento |
| 84  | 5         | ConcluÃ­do   |
| 85  | 9         | Entregue     |
| 86  | 18        | Em Andamento |
| 87  | 1         | ConcluÃ­do   |
| 88  | 22        | Entregue     |
| 89  | 15        | Em Andamento |
| 90  | 19        | ConcluÃ­do   |
| 91  | 21        | Entregue     |
| 92  | 7         | Em Andamento |
| 93  | 11        | ConcluÃ­do   |
| 94  | 13        | Entregue     |
| 95  | 3         | Em Andamento |
| 96  | 24        | ConcluÃ­do   |
| 97  | 17        | Entregue     |
| 98  | 23        | Em Andamento |
| 99  | 6         | ConcluÃ­do   |
| 100 | 20        | Entregue     |
| 101 | 14        | Em Andamento |
| 102 | 25        | ConcluÃ­do   |
| 103 | 8         | Em Andamento |
| 104 | 10        | ConcluÃ­do   |
| 105 | 4         | Entregue     |
| 106 | 2         | Em Andamento |
| 107 | 16        | ConcluÃ­do   |
| 108 | 12        | Entregue     |
| 109 | 26        | Em Andamento |
| 110 | 5         | ConcluÃ­do   |
| 111 | 9         | Entregue     |
| 112 | 18        | Em Andamento |
| 113 | 1         | ConcluÃ­do   |
| 114 | 22        | Entregue     |
| 115 | 15        | Em Andamento |
| 116 | 19        | ConcluÃ­do   |
| 117 | 21        | Entregue     |
| 118 | 7         | Em Andamento |
| 119 | 11        | ConcluÃ­do   |
| 120 | 13        | Entregue     |
| 121 | 3         | Em Andamento |
| 122 | 24        | ConcluÃ­do   |
| 123 | 17        | Entregue     |
| 124 | 23        | Em Andamento |
| 125 | 6         | ConcluÃ­do   |
| 126 | 20        | Entregue     |
| 127 | 14        | Em Andamento |
| 128 | 25        | ConcluÃ­do   |
| 129 | 8         | Entregue     |
| 130 | 10        | Em Andamento |
| 131 | 4         | ConcluÃ­do   |
| 132 | 2         | Entregue     |
| 133 | 16        | Em Andamento |
| 134 | 12        | ConcluÃ­do   |
| 135 | 26        | Entregue     |
| 136 | 5         | Em Andamento |
| 137 | 9         | ConcluÃ­do   |
| 138 | 18        | Entregue     |
| 139 | 1         | Em Andamento |
| 140 | 22        | ConcluÃ­do   |
| 141 | 15        | Entregue     |
| 142 | 19        | Em Andamento |
| 143 | 21        | ConcluÃ­do   |
| 144 | 7         | Entregue     |
| 145 | 11        | Em Andamento |
| 146 | 13        | ConcluÃ­do   |
| 147 | 3         | Entregue     |
| 148 | 24        | Em Andamento |
| 149 | 17        | ConcluÃ­do   |
| 150 | 23        | Em Andamento |
| 151 | 6         | Entregue     |
| 152 | 8         | Em Andamento |
| 153 | 10        | ConcluÃ­do   |
| 154 | 4         | Entregue     |
| 155 | 2         | Em Andamento |
| 156 | 16        | ConcluÃ­do   |
| 157 | 12        | Entregue     |
| 158 | 26        | Em Andamento |
| 159 | 5         | ConcluÃ­do   |
| 160 | 9         | Entregue     |
| 161 | 18        | Em Andamento |
| 162 | 1         | ConcluÃ­do   |
| 163 | 22        | Entregue     |
| 164 | 15        | Em Andamento |
| 165 | 19        | ConcluÃ­do   |
| 166 | 21        | Entregue     |
| 167 | 7         | Em Andamento |
| 168 | 11        | ConcluÃ­do   |
| 169 | 13        | Entregue     |
| 170 | 3         | Em Andamento |
| 171 | 24        | ConcluÃ­do   |
| 172 | 17        | Entregue     |
| 173 | 23        | Em Andamento |
| 174 | 6         | ConcluÃ­do   |
| 175 | 20        | Entregue     |
| 176 | 14        | Em Andamento |
| 177 | 25        | ConcluÃ­do   |
| 178 | 8         | Entregue     |
| 179 | 10        | Em Andamento |
| 180 | 4         | ConcluÃ­do   |
| 181 | 2         | Entregue     |
| 182 | 16        | Em Andamento |
| 183 | 12        | ConcluÃ­do   |
| 184 | 26        | Entregue     |
| 185 | 5         | Em Andamento |
| 186 | 9         | ConcluÃ­do   |
| 187 | 18        | Entregue     |
| 188 | 1         | Em Andamento |
| 189 | 22        | ConcluÃ­do   |
| 190 | 15        | Entregue     |
| 191 | 19        | Em Andamento |
| 192 | 21        | ConcluÃ­do   |
| 193 | 7         | Entregue     |
| 194 | 11        | Em Andamento |
| 195 | 13        | ConcluÃ­do   |
| 196 | 3         | Entregue     |
| 197 | 24        | Em Andamento |
| 198 | 17        | ConcluÃ­do   |
| 199 | 23        | Entregue     |
| 200 | 6         | Em Andamento |
| 201 | 8         | Em Andamento |
| 202 | 10        | ConcluÃ­do   |
| 203 | 4         | Entregue     |
| 204 | 2         | Em Andamento |
| 205 | 16        | ConcluÃ­do   |
| 206 | 12        | Entregue     |
| 207 | 26        | Em Andamento |
| 208 | 5         | ConcluÃ­do   |
| 209 | 9         | Entregue     |
| 210 | 18        | Em Andamento |
| 211 | 1         | ConcluÃ­do   |
| 212 | 22        | Entregue     |
| 213 | 15        | Em Andamento |
| 214 | 19        | ConcluÃ­do   |
| 215 | 21        | Entregue     |
| 216 | 7         | Em Andamento |
| 217 | 11        | ConcluÃ­do   |
| 218 | 13        | Entregue     |
| 219 | 3         | Em Andamento |
| 220 | 24        | ConcluÃ­do   |
| 221 | 17        | Entregue     |
| 222 | 23        | Em Andamento |
| 223 | 6         | ConcluÃ­do   |
| 224 | 20        | Entregue     |
| 225 | 14        | Em Andamento |
| 226 | 25        | ConcluÃ­do   |
| 227 | 8         | Entregue     |
| 228 | 10        | Em Andamento |
| 229 | 4         | ConcluÃ­do   |
| 230 | 2         | Entregue     |
| 231 | 16        | Em Andamento |
| 232 | 12        | ConcluÃ­do   |
| 233 | 26        | Entregue     |
| 234 | 5         | Em Andamento |
| 235 | 9         | ConcluÃ­do   |
| 236 | 18        | Entregue     |
| 237 | 1         | Em Andamento |
| 238 | 22        | ConcluÃ­do   |
| 239 | 15        | Entregue     |
| 240 | 19        | Em Andamento |
| 241 | 21        | ConcluÃ­do   |
| 242 | 7         | Entregue     |
| 243 | 11        | Em Andamento |
| 244 | 13        | ConcluÃ­do   |
| 245 | 3         | Entregue     |
| 246 | 24        | Em Andamento |
| 247 | 17        | ConcluÃ­do   |
| 248 | 23        | Entregue     |
| 249 | 6         | Em Andamento |
| 250 | 8         | ConcluÃ­do   |
| 251 | 10        | Entregue     |
| 252 | 4         | Em Andamento |
| 253 | 2         | ConcluÃ­do   |
| 254 | 16        | Entregue     |
| 255 | 12        | Em Andamento |
| 256 | 26        | ConcluÃ­do   |
| 257 | 5         | Entregue     |
| 258 | 9         | Em Andamento |
| 259 | 18        | ConcluÃ­do   |
| 260 | 1         | Entregue     |
| 261 | 22        | Em Andamento |
| 262 | 15        | ConcluÃ­do   |
| 263 | 19        | Entregue     |
| 264 | 21        | Em Andamento |
| 265 | 7         | ConcluÃ­do   |
| 266 | 11        | Entregue     |
| 267 | 13        | Em Andamento |
| 268 | 3         | ConcluÃ­do   |
| 269 | 24        | Entregue     |
| 270 | 17        | Em Andamento |
| 271 | 23        | ConcluÃ­do   |
| 272 | 6         | Entregue     |
| 273 | 8         | Em Andamento |
| 274 | 10        | ConcluÃ­do   |
| 275 | 4         | Entregue     |
| 276 | 2         | Em Andamento |
| 277 | 8         | Em Andamento |
| 278 | 10        | ConcluÃ­do   |
| 279 | 4         | Entregue     |
| 280 | 2         | Em Andamento |
| 281 | 16        | ConcluÃ­do   |
| 282 | 12        | Entregue     |
| 283 | 26        | Em Andamento |
| 284 | 5         | ConcluÃ­do   |
| 285 | 9         | Entregue     |
| 286 | 18        | Em Andamento |
| 287 | 1         | ConcluÃ­do   |
| 288 | 22        | Entregue     |
| 289 | 15        | Em Andamento |
| 290 | 19        | ConcluÃ­do   |
| 291 | 21        | Entregue     |
| 292 | 7         | Em Andamento |
| 293 | 11        | ConcluÃ­do   |
| 294 | 13        | Entregue     |
| 295 | 3         | Em Andamento |
| 296 | 24        | ConcluÃ­do   |
| 297 | 17        | Entregue     |
| 298 | 23        | Em Andamento |
| 299 | 6         | ConcluÃ­do   |
| 300 | 20        | Entregue     |
| 301 | 14        | Em Andamento |
| 302 | 25        | ConcluÃ­do   |
| 303 | 8         | Entregue     |
| 304 | 10        | Em Andamento |
| 305 | 4         | ConcluÃ­do   |
| 306 | 2         | Entregue     |
| 307 | 16        | Em Andamento |
| 308 | 12        | ConcluÃ­do   |
| 309 | 26        | Entregue     |
| 310 | 5         | Em Andamento |
| 311 | 9         | ConcluÃ­do   |
| 312 | 18        | Entregue     |
| 313 | 1         | Em Andamento |
| 314 | 22        | ConcluÃ­do   |
| 315 | 15        | Entregue     |
| 316 | 19        | Em Andamento |
| 317 | 21        | ConcluÃ­do   |
| 318 | 7         | Entregue     |
| 319 | 11        | Em Andamento |
| 320 | 13        | ConcluÃ­do   |
| 321 | 3         | Entregue     |
| 322 | 24        | Em Andamento |
| 323 | 17        | ConcluÃ­do   |
| 324 | 23        | Entregue     |
| 325 | 6         | Em Andamento |
| 326 | 8         | ConcluÃ­do   |
| 327 | 10        | Entregue     |
| 328 | 4         | Em Andamento |
| 329 | 2         | ConcluÃ­do   |
| 330 | 16        | Entregue     |
| 331 | 12        | Em Andamento |
| 332 | 26        | ConcluÃ­do   |
| 333 | 5         | Entregue     |
| 334 | 9         | Em Andamento |
| 335 | 18        | ConcluÃ­do   |
| 336 | 1         | Entregue     |
| 337 | 22        | Em Andamento |
| 338 | 15        | ConcluÃ­do   |
| 339 | 19        | Entregue     |
| 340 | 21        | Em Andamento |
| 341 | 7         | ConcluÃ­do   |
| 342 | 11        | Entregue     |
| 343 | 13        | Em Andamento |
| 344 | 3         | ConcluÃ­do   |
| 345 | 24        | Entregue     |
| 346 | 17        | Em Andamento |
| 347 | 23        | ConcluÃ­do   |
| 348 | 6         | Entregue     |
| 349 | 8         | Em Andamento |
| 350 | 10        | ConcluÃ­do   |
| 351 | 4         | Entregue     |
| 352 | 2         | Em Andamento |
| 353 | 16        | ConcluÃ­do   |
| 354 | 12        | Entregue     |
| 355 | 8         | Em Andamento |
| 356 | 10        | ConcluÃ­do   |
| 357 | 4         | Entregue     |
| 358 | 2         | Em Andamento |
| 359 | 16        | ConcluÃ­do   |
| 360 | 12        | Entregue     |
| 361 | 26        | Em Andamento |
| 362 | 5         | ConcluÃ­do   |
| 363 | 9         | Entregue     |
| 364 | 18        | Em Andamento |
| 365 | 1         | ConcluÃ­do   |
| 366 | 22        | Entregue     |
| 367 | 15        | Em Andamento |
| 368 | 19        | ConcluÃ­do   |
| 369 | 21        | Entregue     |
| 370 | 7         | Em Andamento |
| 371 | 11        | ConcluÃ­do   |
| 372 | 13        | Entregue     |
| 373 | 3         | Em Andamento |
| 374 | 24        | ConcluÃ­do   |
| 375 | 17        | Entregue     |
| 376 | 23        | Em Andamento |
| 377 | 6         | ConcluÃ­do   |
| 378 | 20        | Entregue     |
| 379 | 14        | Em Andamento |
| 380 | 25        | ConcluÃ­do   |
| 381 | 8         | Entregue     |
| 382 | 10        | Em Andamento |
| 383 | 4         | ConcluÃ­do   |
| 384 | 2         | Entregue     |
| 385 | 16        | Em Andamento |
| 386 | 12        | ConcluÃ­do   |
| 387 | 26        | Entregue     |
| 388 | 5         | Em Andamento |
| 389 | 9         | ConcluÃ­do   |
| 390 | 18        | Entregue     |
| 391 | 1         | Em Andamento |
| 392 | 22        | ConcluÃ­do   |
| 393 | 15        | Entregue     |
| 394 | 19        | Em Andamento |
| 395 | 21        | ConcluÃ­do   |
| 396 | 7         | Entregue     |
| 397 | 11        | Em Andamento |
| 398 | 13        | ConcluÃ­do   |
| 399 | 3         | Entregue     |
| 400 | 24        | Em Andamento |
| 401 | 17        | ConcluÃ­do   |
| 402 | 23        | Entregue     |
| 403 | 6         | Em Andamento |
| 404 | 8         | ConcluÃ­do   |
| 405 | 10        | Entregue     |
| 406 | 4         | Em Andamento |
| 407 | 2         | ConcluÃ­do   |
| 408 | 16        | Entregue     |
| 409 | 12        | Em Andamento |
| 410 | 26        | ConcluÃ­do   |
| 411 | 5         | Entregue     |
| 412 | 9         | Em Andamento |
| 413 | 18        | ConcluÃ­do   |
| 414 | 1         | Entregue     |
| 415 | 22        | Em Andamento |
| 416 | 15        | ConcluÃ­do   |
| 417 | 19        | Entregue     |
| 418 | 21        | Em Andamento |
| 419 | 7         | ConcluÃ­do   |
| 420 | 11        | Entregue     |
| 421 | 13        | Em Andamento |
| 422 | 3         | ConcluÃ­do   |
| 423 | 24        | Entregue     |
| 424 | 17        | Em Andamento |
| 425 | 23        | ConcluÃ­do   |
| 426 | 6         | Entregue     |
| 427 | 8         | Em Andamento |
| 428 | 10        | ConcluÃ­do   |
| 429 | 4         | Entregue     |
| 430 | 2         | Em Andamento |
| 431 | 16        | ConcluÃ­do   |
| 432 | 12        | Entregue     |
| 433 | 26        | Em Andamento |
| 434 | 5         | ConcluÃ­do   |
| 435 | 9         | Entregue     |
| 436 | 18        | Em Andamento |
| 437 | 1         | ConcluÃ­do   |
| 438 | 22        | Entregue     |
| 439 | 15        | Em Andamento |
| 440 | 19        | ConcluÃ­do   |
| 441 | 21        | Entregue     |
| 442 | 7         | Em Andamento |
| 443 | 11        | ConcluÃ­do   |
| 444 | 13        | Entregue     |
| 445 | 3         | Em Andamento |
| 446 | 24        | ConcluÃ­do   |
| 447 | 17        | Entregue     |
| 448 | 23        | Em Andamento |
| 449 | 6         | ConcluÃ­do   |
| 450 | 8         | Entregue     |

---
**Query #3**

    -- Resultado: vemos números, mas não nomes. Precisamos "cruzar" tabelas!
    
    
    -- ============================================================
    -- PARTE 2 — JOINs: AS PONTES ENTRE TABELAS
    -- ============================================================
    
    -- --------------------------------------------------
    -- 2.1  INNER JOIN — só o que existe nos dois lados
    -- --------------------------------------------------
    -- Analogia: "Mostre-me apenas os clientes que JÁ fizeram pedidos."
    -- A ponte é: pedidos.idcliente = clientes.id
    
    SELECT
        c.nome          AS cliente,        -- nome vem da tabela clientes
        c.telefone,
        p.id            AS numero_pedido,
        p.datahorapedido,
        p.status
    FROM pedidos AS p                      -- tabela à esquerda
    INNER JOIN clientes AS c               -- tabela à direita
        ON p.idcliente = c.id;

| cliente               | telefone   | numero_pedido | datahorapedido      | status       |
| --------------------- | ---------- | ------------- | ------------------- | ------------ |
| Maria Silva           | 115551234  | 6             | 2023-01-02 12:45:00 | Entregue     |
| Maria Silva           | 115551234  | 48            | 2023-02-15 10:00:00 | Em Andamento |
| Maria Silva           | 115551234  | 61            | 2023-03-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 87            | 2023-04-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 113           | 2023-05-03 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 139           | 2023-05-20 08:45:00 | Em Andamento |
| Maria Silva           | 115551234  | 162           | 2023-06-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 188           | 2023-06-13 08:45:00 | Em Andamento |
| Maria Silva           | 115551234  | 211           | 2023-07-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 237           | 2023-07-13 08:45:00 | Em Andamento |
| Maria Silva           | 115551234  | 260           | 2023-07-23 08:45:00 | Entregue     |
| Maria Silva           | 115551234  | 287           | 2023-08-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 313           | 2023-08-13 08:45:00 | Em Andamento |
| Maria Silva           | 115551234  | 336           | 2023-08-23 08:45:00 | Entregue     |
| Maria Silva           | 115551234  | 365           | 2023-09-04 08:45:00 | ConcluÃ­do   |
| Maria Silva           | 115551234  | 391           | 2023-09-13 08:45:00 | Em Andamento |
| Maria Silva           | 115551234  | 414           | 2023-09-23 08:45:00 | Entregue     |
| Maria Silva           | 115551234  | 437           | 2023-10-03 08:45:00 | ConcluÃ­do   |
| João Pereira          | 215555678  | 20            | 2023-01-18 10:30:00 | Entregue     |
| João Pereira          | 215555678  | 29            | 2023-02-01 11:15:00 | Entregue     |
| João Pereira          | 215555678  | 54            | 2023-03-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 80            | 2023-04-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 106           | 2023-05-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 132           | 2023-05-15 12:00:00 | Entregue     |
| João Pereira          | 215555678  | 155           | 2023-06-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 181           | 2023-06-10 12:00:00 | Entregue     |
| João Pereira          | 215555678  | 204           | 2023-07-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 230           | 2023-07-10 12:00:00 | Entregue     |
| João Pereira          | 215555678  | 253           | 2023-07-20 12:00:00 | ConcluÃ­do   |
| João Pereira          | 215555678  | 276           | 2023-07-30 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 280           | 2023-08-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 306           | 2023-08-10 12:00:00 | Entregue     |
| João Pereira          | 215555678  | 329           | 2023-08-20 12:00:00 | ConcluÃ­do   |
| João Pereira          | 215555678  | 352           | 2023-08-30 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 358           | 2023-09-01 12:00:00 | Em Andamento |
| João Pereira          | 215555678  | 384           | 2023-09-10 12:00:00 | Entregue     |
| João Pereira          | 215555678  | 407           | 2023-09-20 12:00:00 | ConcluÃ­do   |
| João Pereira          | 215555678  | 430           | 2023-09-30 12:00:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 2             | 2023-01-02 08:45:00 | ConcluÃ­do   |
| Ana Rodrigues         | 315557890  | 38            | 2023-02-07 10:45:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 69            | 2023-03-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 95            | 2023-04-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 121           | 2023-05-06 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 147           | 2023-05-30 08:15:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 170           | 2023-06-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 196           | 2023-06-15 08:15:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 219           | 2023-07-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 245           | 2023-07-15 08:15:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 268           | 2023-07-25 08:15:00 | ConcluÃ­do   |
| Ana Rodrigues         | 315557890  | 295           | 2023-08-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 321           | 2023-08-15 08:15:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 344           | 2023-08-25 08:15:00 | ConcluÃ­do   |
| Ana Rodrigues         | 315557890  | 373           | 2023-09-07 08:15:00 | Em Andamento |
| Ana Rodrigues         | 315557890  | 399           | 2023-09-15 08:15:00 | Entregue     |
| Ana Rodrigues         | 315557890  | 422           | 2023-09-25 08:15:00 | ConcluÃ­do   |
| Ana Rodrigues         | 315557890  | 445           | 2023-10-05 08:15:00 | Em Andamento |
| Pedro Alves           | 415552345  | 11            | 2023-01-06 10:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 34            | 2023-02-06 08:00:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 53            | 2023-03-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 79            | 2023-04-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 105           | 2023-05-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 131           | 2023-05-15 11:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 154           | 2023-06-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 180           | 2023-06-10 11:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 203           | 2023-07-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 229           | 2023-07-10 11:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 252           | 2023-07-20 11:45:00 | Em Andamento |
| Pedro Alves           | 415552345  | 275           | 2023-07-30 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 279           | 2023-08-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 305           | 2023-08-10 11:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 328           | 2023-08-20 11:45:00 | Em Andamento |
| Pedro Alves           | 415552345  | 351           | 2023-08-30 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 357           | 2023-09-01 11:45:00 | Entregue     |
| Pedro Alves           | 415552345  | 383           | 2023-09-10 11:45:00 | ConcluÃ­do   |
| Pedro Alves           | 415552345  | 406           | 2023-09-20 11:45:00 | Em Andamento |
| Pedro Alves           | 415552345  | 429           | 2023-09-30 11:45:00 | Entregue     |
| Sofia Santos          | 515558765  | 12            | 2023-01-06 12:00:00 | Em Andamento |
| Sofia Santos          | 515558765  | 44            | 2023-02-12 10:30:00 | Entregue     |
| Sofia Santos          | 515558765  | 58            | 2023-03-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 84            | 2023-04-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 110           | 2023-05-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 136           | 2023-05-20 08:30:00 | Em Andamento |
| Sofia Santos          | 515558765  | 159           | 2023-06-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 185           | 2023-06-12 08:30:00 | Em Andamento |
| Sofia Santos          | 515558765  | 208           | 2023-07-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 234           | 2023-07-12 08:30:00 | Em Andamento |
| Sofia Santos          | 515558765  | 257           | 2023-07-22 08:30:00 | Entregue     |
| Sofia Santos          | 515558765  | 284           | 2023-08-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 310           | 2023-08-12 08:30:00 | Em Andamento |
| Sofia Santos          | 515558765  | 333           | 2023-08-22 08:30:00 | Entregue     |
| Sofia Santos          | 515558765  | 362           | 2023-09-03 08:30:00 | ConcluÃ­do   |
| Sofia Santos          | 515558765  | 388           | 2023-09-12 08:30:00 | Em Andamento |
| Sofia Santos          | 515558765  | 411           | 2023-09-22 08:30:00 | Entregue     |
| Sofia Santos          | 515558765  | 434           | 2023-10-02 08:30:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 21            | 2023-01-22 08:00:00 | Em Andamento |
| Jorge Lima            | 615553421  | 50            | 2023-02-18 12:00:00 | Entregue     |
| Jorge Lima            | 615553421  | 73            | 2023-03-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 99            | 2023-04-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 125           | 2023-05-07 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 151           | 2023-05-30 09:45:00 | Entregue     |
| Jorge Lima            | 615553421  | 174           | 2023-06-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 200           | 2023-06-16 09:45:00 | Em Andamento |
| Jorge Lima            | 615553421  | 223           | 2023-07-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 249           | 2023-07-16 09:45:00 | Em Andamento |
| Jorge Lima            | 615553421  | 272           | 2023-07-26 09:45:00 | Entregue     |
| Jorge Lima            | 615553421  | 299           | 2023-08-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 325           | 2023-08-16 09:45:00 | Em Andamento |
| Jorge Lima            | 615553421  | 348           | 2023-08-26 09:45:00 | Entregue     |
| Jorge Lima            | 615553421  | 377           | 2023-09-08 09:45:00 | ConcluÃ­do   |
| Jorge Lima            | 615553421  | 403           | 2023-09-16 09:45:00 | Em Andamento |
| Jorge Lima            | 615553421  | 426           | 2023-09-26 09:45:00 | Entregue     |
| Jorge Lima            | 615553421  | 449           | 2023-10-06 09:45:00 | ConcluÃ­do   |
| Luisa Ferreira        | 715559876  | 5             | 2023-01-02 11:30:00 | ConcluÃ­do   |
| Luisa Ferreira        | 715559876  | 32            | 2023-02-05 08:15:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 66            | 2023-03-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 92            | 2023-04-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 118           | 2023-05-04 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 144           | 2023-05-25 10:45:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 167           | 2023-06-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 193           | 2023-06-14 10:45:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 216           | 2023-07-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 242           | 2023-07-14 10:45:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 265           | 2023-07-24 10:45:00 | ConcluÃ­do   |
| Luisa Ferreira        | 715559876  | 292           | 2023-08-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 318           | 2023-08-14 10:45:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 341           | 2023-08-24 10:45:00 | ConcluÃ­do   |
| Luisa Ferreira        | 715559876  | 370           | 2023-09-05 10:45:00 | Em Andamento |
| Luisa Ferreira        | 715559876  | 396           | 2023-09-14 10:45:00 | Entregue     |
| Luisa Ferreira        | 715559876  | 419           | 2023-09-24 10:45:00 | ConcluÃ­do   |
| Luisa Ferreira        | 715559876  | 442           | 2023-10-04 10:45:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 3             | 2023-01-02 09:30:00 | Entregue     |
| Carlos Gomes          | 815552345  | 27            | 2023-02-01 08:30:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 51            | 2023-03-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 77            | 2023-04-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 103           | 2023-05-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 129           | 2023-05-15 08:15:00 | Entregue     |
| Carlos Gomes          | 815552345  | 152           | 2023-06-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 178           | 2023-06-10 08:15:00 | Entregue     |
| Carlos Gomes          | 815552345  | 201           | 2023-07-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 227           | 2023-07-10 08:15:00 | Entregue     |
| Carlos Gomes          | 815552345  | 250           | 2023-07-20 08:15:00 | ConcluÃ­do   |
| Carlos Gomes          | 815552345  | 273           | 2023-07-30 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 277           | 2023-08-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 303           | 2023-08-10 08:15:00 | Entregue     |
| Carlos Gomes          | 815552345  | 326           | 2023-08-20 08:15:00 | ConcluÃ­do   |
| Carlos Gomes          | 815552345  | 349           | 2023-08-30 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 355           | 2023-09-01 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 381           | 2023-09-10 08:15:00 | Entregue     |
| Carlos Gomes          | 815552345  | 404           | 2023-09-20 08:15:00 | ConcluÃ­do   |
| Carlos Gomes          | 815552345  | 427           | 2023-09-30 08:15:00 | Em Andamento |
| Carlos Gomes          | 815552345  | 450           | 2023-10-06 10:30:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 8             | 2023-01-06 09:00:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 43            | 2023-02-12 08:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 59            | 2023-03-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 85            | 2023-04-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 111           | 2023-05-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 137           | 2023-05-20 10:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 160           | 2023-06-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 186           | 2023-06-12 10:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 209           | 2023-07-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 235           | 2023-07-12 10:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 258           | 2023-07-22 10:45:00 | Em Andamento |
| Marta Ribeiro         | 915555432  | 285           | 2023-08-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 311           | 2023-08-12 10:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 334           | 2023-08-22 10:45:00 | Em Andamento |
| Marta Ribeiro         | 915555432  | 363           | 2023-09-03 10:45:00 | Entregue     |
| Marta Ribeiro         | 915555432  | 389           | 2023-09-12 10:45:00 | ConcluÃ­do   |
| Marta Ribeiro         | 915555432  | 412           | 2023-09-22 10:45:00 | Em Andamento |
| Marta Ribeiro         | 915555432  | 435           | 2023-10-02 10:45:00 | Entregue     |
| Ana Maria Silva       | 1515557890 | 1             | 2023-01-02 08:15:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 33            | 2023-02-05 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 52            | 2023-03-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 78            | 2023-04-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 104           | 2023-05-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 130           | 2023-05-15 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 153           | 2023-06-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 179           | 2023-06-10 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 202           | 2023-07-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 228           | 2023-07-10 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 251           | 2023-07-20 10:30:00 | Entregue     |
| Ana Maria Silva       | 1515557890 | 274           | 2023-07-30 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 278           | 2023-08-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 304           | 2023-08-10 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 327           | 2023-08-20 10:30:00 | Entregue     |
| Ana Maria Silva       | 1515557890 | 350           | 2023-08-30 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 356           | 2023-09-01 10:30:00 | ConcluÃ­do   |
| Ana Maria Silva       | 1515557890 | 382           | 2023-09-10 10:30:00 | Em Andamento |
| Ana Maria Silva       | 1515557890 | 405           | 2023-09-20 10:30:00 | Entregue     |
| Ana Maria Silva       | 1515557890 | 428           | 2023-09-30 10:30:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 22            | 2023-01-22 09:30:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 35            | 2023-02-06 10:15:00 | Entregue     |
| André Almeida         | 1015556789 | 67            | 2023-03-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 93            | 2023-04-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 119           | 2023-05-05 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 145           | 2023-05-25 11:00:00 | Em Andamento |
| André Almeida         | 1015556789 | 168           | 2023-06-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 194           | 2023-06-15 11:00:00 | Em Andamento |
| André Almeida         | 1015556789 | 217           | 2023-07-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 243           | 2023-07-15 11:00:00 | Em Andamento |
| André Almeida         | 1015556789 | 266           | 2023-07-25 11:00:00 | Entregue     |
| André Almeida         | 1015556789 | 293           | 2023-08-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 319           | 2023-08-15 11:00:00 | Em Andamento |
| André Almeida         | 1015556789 | 342           | 2023-08-25 11:00:00 | Entregue     |
| André Almeida         | 1015556789 | 371           | 2023-09-06 11:00:00 | ConcluÃ­do   |
| André Almeida         | 1015556789 | 397           | 2023-09-15 11:00:00 | Em Andamento |
| André Almeida         | 1015556789 | 420           | 2023-09-25 11:00:00 | Entregue     |
| André Almeida         | 1015556789 | 443           | 2023-10-05 11:00:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 9             | 2023-01-06 09:30:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 28            | 2023-02-01 10:00:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 56            | 2023-03-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 82            | 2023-04-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 108           | 2023-05-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 134           | 2023-05-15 10:15:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 157           | 2023-06-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 183           | 2023-06-11 10:15:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 206           | 2023-07-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 232           | 2023-07-11 10:15:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 255           | 2023-07-21 10:15:00 | Em Andamento |
| João Carlos Rodrigues | 1615552345 | 282           | 2023-08-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 308           | 2023-08-11 10:15:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 331           | 2023-08-21 10:15:00 | Em Andamento |
| João Carlos Rodrigues | 1615552345 | 354           | 2023-08-31 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 360           | 2023-09-02 10:15:00 | Entregue     |
| João Carlos Rodrigues | 1615552345 | 386           | 2023-09-11 10:15:00 | ConcluÃ­do   |
| João Carlos Rodrigues | 1615552345 | 409           | 2023-09-21 10:15:00 | Em Andamento |
| João Carlos Rodrigues | 1615552345 | 432           | 2023-10-01 10:15:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 18            | 2023-01-18 09:15:00 | Em Andamento |
| Isabela Pereira       | 1115558765 | 42            | 2023-02-10 11:00:00 | Em Andamento |
| Isabela Pereira       | 1115558765 | 68            | 2023-03-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 94            | 2023-04-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 120           | 2023-05-05 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 146           | 2023-05-25 12:30:00 | ConcluÃ­do   |
| Isabela Pereira       | 1115558765 | 169           | 2023-06-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 195           | 2023-06-15 12:30:00 | ConcluÃ­do   |
| Isabela Pereira       | 1115558765 | 218           | 2023-07-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 244           | 2023-07-15 12:30:00 | ConcluÃ­do   |
| Isabela Pereira       | 1115558765 | 267           | 2023-07-25 12:30:00 | Em Andamento |
| Isabela Pereira       | 1115558765 | 294           | 2023-08-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 320           | 2023-08-15 12:30:00 | ConcluÃ­do   |
| Isabela Pereira       | 1115558765 | 343           | 2023-08-25 12:30:00 | Em Andamento |
| Isabela Pereira       | 1115558765 | 372           | 2023-09-06 12:30:00 | Entregue     |
| Isabela Pereira       | 1115558765 | 398           | 2023-09-15 12:30:00 | ConcluÃ­do   |
| Isabela Pereira       | 1115558765 | 421           | 2023-09-25 12:30:00 | Em Andamento |
| Isabela Pereira       | 1115558765 | 444           | 2023-10-05 12:30:00 | Entregue     |
| Isabel Gonçalves      | 1715558765 | 4             | 2023-01-02 10:00:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 75            | 2023-03-09 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 101           | 2023-04-09 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 127           | 2023-05-08 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 176           | 2023-06-09 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 225           | 2023-07-09 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 301           | 2023-08-09 12:45:00 | Em Andamento |
| Isabel Gonçalves      | 1715558765 | 379           | 2023-09-09 12:45:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 16            | 2023-01-12 11:00:00 | ConcluÃ­do   |
| Ricardo Ferreira      | 1815554321 | 36            | 2023-02-06 12:45:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 63            | 2023-03-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 89            | 2023-04-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 115           | 2023-05-03 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 141           | 2023-05-20 10:00:00 | Entregue     |
| Ricardo Ferreira      | 1815554321 | 164           | 2023-06-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 190           | 2023-06-13 10:00:00 | Entregue     |
| Ricardo Ferreira      | 1815554321 | 213           | 2023-07-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 239           | 2023-07-13 10:00:00 | Entregue     |
| Ricardo Ferreira      | 1815554321 | 262           | 2023-07-23 10:00:00 | ConcluÃ­do   |
| Ricardo Ferreira      | 1815554321 | 289           | 2023-08-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 315           | 2023-08-13 10:00:00 | Entregue     |
| Ricardo Ferreira      | 1815554321 | 338           | 2023-08-23 10:00:00 | ConcluÃ­do   |
| Ricardo Ferreira      | 1815554321 | 367           | 2023-09-04 10:00:00 | Em Andamento |
| Ricardo Ferreira      | 1815554321 | 393           | 2023-09-13 10:00:00 | Entregue     |
| Ricardo Ferreira      | 1815554321 | 416           | 2023-09-23 10:00:00 | ConcluÃ­do   |
| Ricardo Ferreira      | 1815554321 | 439           | 2023-10-03 10:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 24            | 2023-01-22 11:15:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 30            | 2023-02-03 09:45:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 55            | 2023-03-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 81            | 2023-04-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 107           | 2023-05-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 133           | 2023-05-15 09:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 156           | 2023-06-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 182           | 2023-06-11 09:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 205           | 2023-07-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 231           | 2023-07-11 09:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 254           | 2023-07-21 09:00:00 | Entregue     |
| Mariana Costa         | 1915551234 | 281           | 2023-08-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 307           | 2023-08-11 09:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 330           | 2023-08-21 09:00:00 | Entregue     |
| Mariana Costa         | 1915551234 | 353           | 2023-08-31 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 359           | 2023-09-02 09:00:00 | ConcluÃ­do   |
| Mariana Costa         | 1915551234 | 385           | 2023-09-11 09:00:00 | Em Andamento |
| Mariana Costa         | 1915551234 | 408           | 2023-09-21 09:00:00 | Entregue     |
| Mariana Costa         | 1915551234 | 431           | 2023-10-01 09:00:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 26            | 2023-01-26 12:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 71            | 2023-03-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 97            | 2023-04-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 123           | 2023-05-06 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 149           | 2023-05-30 10:30:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 172           | 2023-06-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 198           | 2023-06-15 10:30:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 221           | 2023-07-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 247           | 2023-07-15 10:30:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 270           | 2023-07-25 10:30:00 | Em Andamento |
| Luís Carlos Sousa     | 2015555678 | 297           | 2023-08-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 323           | 2023-08-15 10:30:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 346           | 2023-08-25 10:30:00 | Em Andamento |
| Luís Carlos Sousa     | 2015555678 | 375           | 2023-09-07 10:30:00 | Entregue     |
| Luís Carlos Sousa     | 2015555678 | 401           | 2023-09-15 10:30:00 | ConcluÃ­do   |
| Luís Carlos Sousa     | 2015555678 | 424           | 2023-09-25 10:30:00 | Em Andamento |
| Luís Carlos Sousa     | 2015555678 | 447           | 2023-10-05 10:30:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 14            | 2023-01-12 09:45:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 39            | 2023-02-07 11:30:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 60            | 2023-03-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 86            | 2023-04-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 112           | 2023-05-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 138           | 2023-05-20 12:15:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 161           | 2023-06-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 187           | 2023-06-12 12:15:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 210           | 2023-07-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 236           | 2023-07-12 12:15:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 259           | 2023-07-22 12:15:00 | ConcluÃ­do   |
| Silvia Ribeiro        | 2115557890 | 286           | 2023-08-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 312           | 2023-08-12 12:15:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 335           | 2023-08-22 12:15:00 | ConcluÃ­do   |
| Silvia Ribeiro        | 2115557890 | 364           | 2023-09-03 12:15:00 | Em Andamento |
| Silvia Ribeiro        | 2115557890 | 390           | 2023-09-12 12:15:00 | Entregue     |
| Silvia Ribeiro        | 2115557890 | 413           | 2023-09-22 12:15:00 | ConcluÃ­do   |
| Silvia Ribeiro        | 2115557890 | 436           | 2023-10-02 12:15:00 | Em Andamento |
| Artur Santos          | 2215552345 | 15            | 2023-01-12 10:30:00 | Em Andamento |
| Artur Santos          | 2215552345 | 45            | 2023-02-12 12:15:00 | Em Andamento |
| Artur Santos          | 2215552345 | 64            | 2023-03-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 90            | 2023-04-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 116           | 2023-05-04 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 142           | 2023-05-25 08:00:00 | Em Andamento |
| Artur Santos          | 2215552345 | 165           | 2023-06-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 191           | 2023-06-14 08:00:00 | Em Andamento |
| Artur Santos          | 2215552345 | 214           | 2023-07-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 240           | 2023-07-14 08:00:00 | Em Andamento |
| Artur Santos          | 2215552345 | 263           | 2023-07-24 08:00:00 | Entregue     |
| Artur Santos          | 2215552345 | 290           | 2023-08-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 316           | 2023-08-14 08:00:00 | Em Andamento |
| Artur Santos          | 2215552345 | 339           | 2023-08-24 08:00:00 | Entregue     |
| Artur Santos          | 2215552345 | 368           | 2023-09-05 08:00:00 | ConcluÃ­do   |
| Artur Santos          | 2215552345 | 394           | 2023-09-14 08:00:00 | Em Andamento |
| Artur Santos          | 2215552345 | 417           | 2023-09-24 08:00:00 | Entregue     |
| Artur Santos          | 2215552345 | 440           | 2023-10-04 08:00:00 | ConcluÃ­do   |
| Arya Santos           | 2215552852 | 17            | 2023-01-12 12:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 40            | 2023-02-10 08:15:00 | ConcluÃ­do   |
| Arya Santos           | 2215552852 | 74            | 2023-03-08 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 100           | 2023-04-08 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 126           | 2023-05-07 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 175           | 2023-06-08 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 224           | 2023-07-08 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 300           | 2023-08-08 11:15:00 | Entregue     |
| Arya Santos           | 2215552852 | 378           | 2023-09-08 11:15:00 | Entregue     |
| Carolina Lima         | 2315558765 | 23            | 2023-01-22 10:45:00 | Entregue     |
| Carolina Lima         | 2315558765 | 41            | 2023-02-10 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 65            | 2023-03-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 91            | 2023-04-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 117           | 2023-05-04 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 143           | 2023-05-25 09:30:00 | ConcluÃ­do   |
| Carolina Lima         | 2315558765 | 166           | 2023-06-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 192           | 2023-06-14 09:30:00 | ConcluÃ­do   |
| Carolina Lima         | 2315558765 | 215           | 2023-07-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 241           | 2023-07-14 09:30:00 | ConcluÃ­do   |
| Carolina Lima         | 2315558765 | 264           | 2023-07-24 09:30:00 | Em Andamento |
| Carolina Lima         | 2315558765 | 291           | 2023-08-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 317           | 2023-08-14 09:30:00 | ConcluÃ­do   |
| Carolina Lima         | 2315558765 | 340           | 2023-08-24 09:30:00 | Em Andamento |
| Carolina Lima         | 2315558765 | 369           | 2023-09-05 09:30:00 | Entregue     |
| Carolina Lima         | 2315558765 | 395           | 2023-09-14 09:30:00 | ConcluÃ­do   |
| Carolina Lima         | 2315558765 | 418           | 2023-09-24 09:30:00 | Em Andamento |
| Carolina Lima         | 2315558765 | 441           | 2023-10-04 09:30:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 13            | 2023-01-12 08:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 46            | 2023-02-15 08:30:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 62            | 2023-03-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 88            | 2023-04-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 114           | 2023-05-03 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 140           | 2023-05-20 09:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 163           | 2023-06-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 189           | 2023-06-13 09:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 212           | 2023-07-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 238           | 2023-07-13 09:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 261           | 2023-07-23 09:15:00 | Em Andamento |
| Pedro Almeida         | 2415554321 | 288           | 2023-08-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 314           | 2023-08-13 09:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 337           | 2023-08-23 09:15:00 | Em Andamento |
| Pedro Almeida         | 2415554321 | 366           | 2023-09-04 09:15:00 | Entregue     |
| Pedro Almeida         | 2415554321 | 392           | 2023-09-13 09:15:00 | ConcluÃ­do   |
| Pedro Almeida         | 2415554321 | 415           | 2023-09-23 09:15:00 | Em Andamento |
| Pedro Almeida         | 2415554321 | 438           | 2023-10-03 09:15:00 | Entregue     |
| Inês Gonçalves        | 2515551234 | 19            | 2023-01-18 09:45:00 | ConcluÃ­do   |
| Inês Gonçalves        | 2515551234 | 49            | 2023-02-18 11:45:00 | ConcluÃ­do   |
| Inês Gonçalves        | 2515551234 | 72            | 2023-03-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 98            | 2023-04-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 124           | 2023-05-07 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 150           | 2023-05-30 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 173           | 2023-06-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 199           | 2023-06-16 08:00:00 | Entregue     |
| Inês Gonçalves        | 2515551234 | 222           | 2023-07-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 248           | 2023-07-16 08:00:00 | Entregue     |
| Inês Gonçalves        | 2515551234 | 271           | 2023-07-26 08:00:00 | ConcluÃ­do   |
| Inês Gonçalves        | 2515551234 | 298           | 2023-08-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 324           | 2023-08-16 08:00:00 | Entregue     |
| Inês Gonçalves        | 2515551234 | 347           | 2023-08-26 08:00:00 | ConcluÃ­do   |
| Inês Gonçalves        | 2515551234 | 376           | 2023-09-08 08:00:00 | Em Andamento |
| Inês Gonçalves        | 2515551234 | 402           | 2023-09-16 08:00:00 | Entregue     |
| Inês Gonçalves        | 2515551234 | 425           | 2023-09-26 08:00:00 | ConcluÃ­do   |
| Inês Gonçalves        | 2515551234 | 448           | 2023-10-06 08:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 25            | 2023-01-26 12:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 47            | 2023-02-15 09:15:00 | Entregue     |
| Rui Santos            | 1215554321 | 70            | 2023-03-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 96            | 2023-04-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 122           | 2023-05-06 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 148           | 2023-05-30 09:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 171           | 2023-06-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 197           | 2023-06-15 09:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 220           | 2023-07-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 246           | 2023-07-15 09:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 269           | 2023-07-25 09:00:00 | Entregue     |
| Rui Santos            | 1215554321 | 296           | 2023-08-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 322           | 2023-08-15 09:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 345           | 2023-08-25 09:00:00 | Entregue     |
| Rui Santos            | 1215554321 | 374           | 2023-09-07 09:00:00 | ConcluÃ­do   |
| Rui Santos            | 1215554321 | 400           | 2023-09-15 09:00:00 | Em Andamento |
| Rui Santos            | 1215554321 | 423           | 2023-09-25 09:00:00 | Entregue     |
| Rui Santos            | 1215554321 | 446           | 2023-10-05 09:00:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 7             | 2023-01-06 08:30:00 | Em Andamento |
| Diogo Fernandes       | 2615555678 | 31            | 2023-02-03 12:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 76            | 2023-03-09 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 102           | 2023-04-09 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 128           | 2023-05-08 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 177           | 2023-06-09 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 226           | 2023-07-09 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 302           | 2023-08-09 13:30:00 | ConcluÃ­do   |
| Diogo Fernandes       | 2615555678 | 380           | 2023-09-09 13:30:00 | ConcluÃ­do   |
| Helena Lima           | 1315551234 | 10            | 2023-01-06 10:15:00 | Em Andamento |
| Helena Lima           | 1315551234 | 37            | 2023-02-07 09:00:00 | ConcluÃ­do   |
| Helena Lima           | 1315551234 | 57            | 2023-03-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 83            | 2023-04-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 109           | 2023-05-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 135           | 2023-05-15 11:30:00 | Entregue     |
| Helena Lima           | 1315551234 | 158           | 2023-06-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 184           | 2023-06-11 11:30:00 | Entregue     |
| Helena Lima           | 1315551234 | 207           | 2023-07-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 233           | 2023-07-11 11:30:00 | Entregue     |
| Helena Lima           | 1315551234 | 256           | 2023-07-21 11:30:00 | ConcluÃ­do   |
| Helena Lima           | 1315551234 | 283           | 2023-08-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 309           | 2023-08-11 11:30:00 | Entregue     |
| Helena Lima           | 1315551234 | 332           | 2023-08-21 11:30:00 | ConcluÃ­do   |
| Helena Lima           | 1315551234 | 361           | 2023-09-02 11:30:00 | Em Andamento |
| Helena Lima           | 1315551234 | 387           | 2023-09-11 11:30:00 | Entregue     |
| Helena Lima           | 1315551234 | 410           | 2023-09-21 11:30:00 | ConcluÃ­do   |
| Helena Lima           | 1315551234 | 433           | 2023-10-01 11:30:00 | Em Andamento |

---
**Query #4**

    -- condição da "ponte"
    -- Retorna SOMENTE clientes que têm pelo menos 1 pedido.
    
    
    -- --------------------------------------------------
    -- 2.2  LEFT JOIN — tudo da esquerda, mesmo sem par
    -- --------------------------------------------------
    -- Analogia: "Liste TODOS os clientes; se tiver pedido, mostre; se não tiver, mostre NULL."
    
    SELECT
        c.nome          AS cliente,
        p.id            AS numero_pedido,  -- será NULL se não houver pedido
        p.status
    FROM clientes AS c
    LEFT JOIN pedidos AS p
        ON c.id = p.idcliente;

| cliente               | numero_pedido | status       |
| --------------------- | ------------- | ------------ |
| Maria Silva           | 6             | Entregue     |
| Maria Silva           | 48            | Em Andamento |
| Maria Silva           | 61            | ConcluÃ­do   |
| Maria Silva           | 87            | ConcluÃ­do   |
| Maria Silva           | 113           | ConcluÃ­do   |
| Maria Silva           | 139           | Em Andamento |
| Maria Silva           | 162           | ConcluÃ­do   |
| Maria Silva           | 188           | Em Andamento |
| Maria Silva           | 211           | ConcluÃ­do   |
| Maria Silva           | 237           | Em Andamento |
| Maria Silva           | 260           | Entregue     |
| Maria Silva           | 287           | ConcluÃ­do   |
| Maria Silva           | 313           | Em Andamento |
| Maria Silva           | 336           | Entregue     |
| Maria Silva           | 365           | ConcluÃ­do   |
| Maria Silva           | 391           | Em Andamento |
| Maria Silva           | 414           | Entregue     |
| Maria Silva           | 437           | ConcluÃ­do   |
| João Pereira          | 20            | Entregue     |
| João Pereira          | 29            | Entregue     |
| João Pereira          | 54            | Em Andamento |
| João Pereira          | 80            | Em Andamento |
| João Pereira          | 106           | Em Andamento |
| João Pereira          | 132           | Entregue     |
| João Pereira          | 155           | Em Andamento |
| João Pereira          | 181           | Entregue     |
| João Pereira          | 204           | Em Andamento |
| João Pereira          | 230           | Entregue     |
| João Pereira          | 253           | ConcluÃ­do   |
| João Pereira          | 276           | Em Andamento |
| João Pereira          | 280           | Em Andamento |
| João Pereira          | 306           | Entregue     |
| João Pereira          | 329           | ConcluÃ­do   |
| João Pereira          | 352           | Em Andamento |
| João Pereira          | 358           | Em Andamento |
| João Pereira          | 384           | Entregue     |
| João Pereira          | 407           | ConcluÃ­do   |
| João Pereira          | 430           | Em Andamento |
| Ana Rodrigues         | 2             | ConcluÃ­do   |
| Ana Rodrigues         | 38            | Entregue     |
| Ana Rodrigues         | 69            | Em Andamento |
| Ana Rodrigues         | 95            | Em Andamento |
| Ana Rodrigues         | 121           | Em Andamento |
| Ana Rodrigues         | 147           | Entregue     |
| Ana Rodrigues         | 170           | Em Andamento |
| Ana Rodrigues         | 196           | Entregue     |
| Ana Rodrigues         | 219           | Em Andamento |
| Ana Rodrigues         | 245           | Entregue     |
| Ana Rodrigues         | 268           | ConcluÃ­do   |
| Ana Rodrigues         | 295           | Em Andamento |
| Ana Rodrigues         | 321           | Entregue     |
| Ana Rodrigues         | 344           | ConcluÃ­do   |
| Ana Rodrigues         | 373           | Em Andamento |
| Ana Rodrigues         | 399           | Entregue     |
| Ana Rodrigues         | 422           | ConcluÃ­do   |
| Ana Rodrigues         | 445           | Em Andamento |
| Pedro Alves           | 11            | ConcluÃ­do   |
| Pedro Alves           | 34            | ConcluÃ­do   |
| Pedro Alves           | 53            | Entregue     |
| Pedro Alves           | 79            | Entregue     |
| Pedro Alves           | 105           | Entregue     |
| Pedro Alves           | 131           | ConcluÃ­do   |
| Pedro Alves           | 154           | Entregue     |
| Pedro Alves           | 180           | ConcluÃ­do   |
| Pedro Alves           | 203           | Entregue     |
| Pedro Alves           | 229           | ConcluÃ­do   |
| Pedro Alves           | 252           | Em Andamento |
| Pedro Alves           | 275           | Entregue     |
| Pedro Alves           | 279           | Entregue     |
| Pedro Alves           | 305           | ConcluÃ­do   |
| Pedro Alves           | 328           | Em Andamento |
| Pedro Alves           | 351           | Entregue     |
| Pedro Alves           | 357           | Entregue     |
| Pedro Alves           | 383           | ConcluÃ­do   |
| Pedro Alves           | 406           | Em Andamento |
| Pedro Alves           | 429           | Entregue     |
| Sofia Santos          | 12            | Em Andamento |
| Sofia Santos          | 44            | Entregue     |
| Sofia Santos          | 58            | ConcluÃ­do   |
| Sofia Santos          | 84            | ConcluÃ­do   |
| Sofia Santos          | 110           | ConcluÃ­do   |
| Sofia Santos          | 136           | Em Andamento |
| Sofia Santos          | 159           | ConcluÃ­do   |
| Sofia Santos          | 185           | Em Andamento |
| Sofia Santos          | 208           | ConcluÃ­do   |
| Sofia Santos          | 234           | Em Andamento |
| Sofia Santos          | 257           | Entregue     |
| Sofia Santos          | 284           | ConcluÃ­do   |
| Sofia Santos          | 310           | Em Andamento |
| Sofia Santos          | 333           | Entregue     |
| Sofia Santos          | 362           | ConcluÃ­do   |
| Sofia Santos          | 388           | Em Andamento |
| Sofia Santos          | 411           | Entregue     |
| Sofia Santos          | 434           | ConcluÃ­do   |
| Jorge Lima            | 21            | Em Andamento |
| Jorge Lima            | 50            | Entregue     |
| Jorge Lima            | 73            | ConcluÃ­do   |
| Jorge Lima            | 99            | ConcluÃ­do   |
| Jorge Lima            | 125           | ConcluÃ­do   |
| Jorge Lima            | 151           | Entregue     |
| Jorge Lima            | 174           | ConcluÃ­do   |
| Jorge Lima            | 200           | Em Andamento |
| Jorge Lima            | 223           | ConcluÃ­do   |
| Jorge Lima            | 249           | Em Andamento |
| Jorge Lima            | 272           | Entregue     |
| Jorge Lima            | 299           | ConcluÃ­do   |
| Jorge Lima            | 325           | Em Andamento |
| Jorge Lima            | 348           | Entregue     |
| Jorge Lima            | 377           | ConcluÃ­do   |
| Jorge Lima            | 403           | Em Andamento |
| Jorge Lima            | 426           | Entregue     |
| Jorge Lima            | 449           | ConcluÃ­do   |
| Luisa Ferreira        | 5             | ConcluÃ­do   |
| Luisa Ferreira        | 32            | Entregue     |
| Luisa Ferreira        | 66            | Em Andamento |
| Luisa Ferreira        | 92            | Em Andamento |
| Luisa Ferreira        | 118           | Em Andamento |
| Luisa Ferreira        | 144           | Entregue     |
| Luisa Ferreira        | 167           | Em Andamento |
| Luisa Ferreira        | 193           | Entregue     |
| Luisa Ferreira        | 216           | Em Andamento |
| Luisa Ferreira        | 242           | Entregue     |
| Luisa Ferreira        | 265           | ConcluÃ­do   |
| Luisa Ferreira        | 292           | Em Andamento |
| Luisa Ferreira        | 318           | Entregue     |
| Luisa Ferreira        | 341           | ConcluÃ­do   |
| Luisa Ferreira        | 370           | Em Andamento |
| Luisa Ferreira        | 396           | Entregue     |
| Luisa Ferreira        | 419           | ConcluÃ­do   |
| Luisa Ferreira        | 442           | Em Andamento |
| Carlos Gomes          | 3             | Entregue     |
| Carlos Gomes          | 27            | Em Andamento |
| Carlos Gomes          | 51            | Em Andamento |
| Carlos Gomes          | 77            | Em Andamento |
| Carlos Gomes          | 103           | Em Andamento |
| Carlos Gomes          | 129           | Entregue     |
| Carlos Gomes          | 152           | Em Andamento |
| Carlos Gomes          | 178           | Entregue     |
| Carlos Gomes          | 201           | Em Andamento |
| Carlos Gomes          | 227           | Entregue     |
| Carlos Gomes          | 250           | ConcluÃ­do   |
| Carlos Gomes          | 273           | Em Andamento |
| Carlos Gomes          | 277           | Em Andamento |
| Carlos Gomes          | 303           | Entregue     |
| Carlos Gomes          | 326           | ConcluÃ­do   |
| Carlos Gomes          | 349           | Em Andamento |
| Carlos Gomes          | 355           | Em Andamento |
| Carlos Gomes          | 381           | Entregue     |
| Carlos Gomes          | 404           | ConcluÃ­do   |
| Carlos Gomes          | 427           | Em Andamento |
| Carlos Gomes          | 450           | Entregue     |
| Marta Ribeiro         | 8             | ConcluÃ­do   |
| Marta Ribeiro         | 43            | ConcluÃ­do   |
| Marta Ribeiro         | 59            | Entregue     |
| Marta Ribeiro         | 85            | Entregue     |
| Marta Ribeiro         | 111           | Entregue     |
| Marta Ribeiro         | 137           | ConcluÃ­do   |
| Marta Ribeiro         | 160           | Entregue     |
| Marta Ribeiro         | 186           | ConcluÃ­do   |
| Marta Ribeiro         | 209           | Entregue     |
| Marta Ribeiro         | 235           | ConcluÃ­do   |
| Marta Ribeiro         | 258           | Em Andamento |
| Marta Ribeiro         | 285           | Entregue     |
| Marta Ribeiro         | 311           | ConcluÃ­do   |
| Marta Ribeiro         | 334           | Em Andamento |
| Marta Ribeiro         | 363           | Entregue     |
| Marta Ribeiro         | 389           | ConcluÃ­do   |
| Marta Ribeiro         | 412           | Em Andamento |
| Marta Ribeiro         | 435           | Entregue     |
| Ana Maria Silva       | 1             | Em Andamento |
| Ana Maria Silva       | 33            | Em Andamento |
| Ana Maria Silva       | 52            | ConcluÃ­do   |
| Ana Maria Silva       | 78            | ConcluÃ­do   |
| Ana Maria Silva       | 104           | ConcluÃ­do   |
| Ana Maria Silva       | 130           | Em Andamento |
| Ana Maria Silva       | 153           | ConcluÃ­do   |
| Ana Maria Silva       | 179           | Em Andamento |
| Ana Maria Silva       | 202           | ConcluÃ­do   |
| Ana Maria Silva       | 228           | Em Andamento |
| Ana Maria Silva       | 251           | Entregue     |
| Ana Maria Silva       | 274           | ConcluÃ­do   |
| Ana Maria Silva       | 278           | ConcluÃ­do   |
| Ana Maria Silva       | 304           | Em Andamento |
| Ana Maria Silva       | 327           | Entregue     |
| Ana Maria Silva       | 350           | ConcluÃ­do   |
| Ana Maria Silva       | 356           | ConcluÃ­do   |
| Ana Maria Silva       | 382           | Em Andamento |
| Ana Maria Silva       | 405           | Entregue     |
| Ana Maria Silva       | 428           | ConcluÃ­do   |
| André Almeida         | 22            | ConcluÃ­do   |
| André Almeida         | 35            | Entregue     |
| André Almeida         | 67            | ConcluÃ­do   |
| André Almeida         | 93            | ConcluÃ­do   |
| André Almeida         | 119           | ConcluÃ­do   |
| André Almeida         | 145           | Em Andamento |
| André Almeida         | 168           | ConcluÃ­do   |
| André Almeida         | 194           | Em Andamento |
| André Almeida         | 217           | ConcluÃ­do   |
| André Almeida         | 243           | Em Andamento |
| André Almeida         | 266           | Entregue     |
| André Almeida         | 293           | ConcluÃ­do   |
| André Almeida         | 319           | Em Andamento |
| André Almeida         | 342           | Entregue     |
| André Almeida         | 371           | ConcluÃ­do   |
| André Almeida         | 397           | Em Andamento |
| André Almeida         | 420           | Entregue     |
| André Almeida         | 443           | ConcluÃ­do   |
| João Carlos Rodrigues | 9             | Entregue     |
| João Carlos Rodrigues | 28            | ConcluÃ­do   |
| João Carlos Rodrigues | 56            | Entregue     |
| João Carlos Rodrigues | 82            | Entregue     |
| João Carlos Rodrigues | 108           | Entregue     |
| João Carlos Rodrigues | 134           | ConcluÃ­do   |
| João Carlos Rodrigues | 157           | Entregue     |
| João Carlos Rodrigues | 183           | ConcluÃ­do   |
| João Carlos Rodrigues | 206           | Entregue     |
| João Carlos Rodrigues | 232           | ConcluÃ­do   |
| João Carlos Rodrigues | 255           | Em Andamento |
| João Carlos Rodrigues | 282           | Entregue     |
| João Carlos Rodrigues | 308           | ConcluÃ­do   |
| João Carlos Rodrigues | 331           | Em Andamento |
| João Carlos Rodrigues | 354           | Entregue     |
| João Carlos Rodrigues | 360           | Entregue     |
| João Carlos Rodrigues | 386           | ConcluÃ­do   |
| João Carlos Rodrigues | 409           | Em Andamento |
| João Carlos Rodrigues | 432           | Entregue     |
| Isabela Pereira       | 18            | Em Andamento |
| Isabela Pereira       | 42            | Em Andamento |
| Isabela Pereira       | 68            | Entregue     |
| Isabela Pereira       | 94            | Entregue     |
| Isabela Pereira       | 120           | Entregue     |
| Isabela Pereira       | 146           | ConcluÃ­do   |
| Isabela Pereira       | 169           | Entregue     |
| Isabela Pereira       | 195           | ConcluÃ­do   |
| Isabela Pereira       | 218           | Entregue     |
| Isabela Pereira       | 244           | ConcluÃ­do   |
| Isabela Pereira       | 267           | Em Andamento |
| Isabela Pereira       | 294           | Entregue     |
| Isabela Pereira       | 320           | ConcluÃ­do   |
| Isabela Pereira       | 343           | Em Andamento |
| Isabela Pereira       | 372           | Entregue     |
| Isabela Pereira       | 398           | ConcluÃ­do   |
| Isabela Pereira       | 421           | Em Andamento |
| Isabela Pereira       | 444           | Entregue     |
| Isabel Gonçalves      | 4             | Em Andamento |
| Isabel Gonçalves      | 75            | Em Andamento |
| Isabel Gonçalves      | 101           | Em Andamento |
| Isabel Gonçalves      | 127           | Em Andamento |
| Isabel Gonçalves      | 176           | Em Andamento |
| Isabel Gonçalves      | 225           | Em Andamento |
| Isabel Gonçalves      | 301           | Em Andamento |
| Isabel Gonçalves      | 379           | Em Andamento |
| Ricardo Ferreira      | 16            | ConcluÃ­do   |
| Ricardo Ferreira      | 36            | Em Andamento |
| Ricardo Ferreira      | 63            | Em Andamento |
| Ricardo Ferreira      | 89            | Em Andamento |
| Ricardo Ferreira      | 115           | Em Andamento |
| Ricardo Ferreira      | 141           | Entregue     |
| Ricardo Ferreira      | 164           | Em Andamento |
| Ricardo Ferreira      | 190           | Entregue     |
| Ricardo Ferreira      | 213           | Em Andamento |
| Ricardo Ferreira      | 239           | Entregue     |
| Ricardo Ferreira      | 262           | ConcluÃ­do   |
| Ricardo Ferreira      | 289           | Em Andamento |
| Ricardo Ferreira      | 315           | Entregue     |
| Ricardo Ferreira      | 338           | ConcluÃ­do   |
| Ricardo Ferreira      | 367           | Em Andamento |
| Ricardo Ferreira      | 393           | Entregue     |
| Ricardo Ferreira      | 416           | ConcluÃ­do   |
| Ricardo Ferreira      | 439           | Em Andamento |
| Mariana Costa         | 24            | Em Andamento |
| Mariana Costa         | 30            | Em Andamento |
| Mariana Costa         | 55            | ConcluÃ­do   |
| Mariana Costa         | 81            | ConcluÃ­do   |
| Mariana Costa         | 107           | ConcluÃ­do   |
| Mariana Costa         | 133           | Em Andamento |
| Mariana Costa         | 156           | ConcluÃ­do   |
| Mariana Costa         | 182           | Em Andamento |
| Mariana Costa         | 205           | ConcluÃ­do   |
| Mariana Costa         | 231           | Em Andamento |
| Mariana Costa         | 254           | Entregue     |
| Mariana Costa         | 281           | ConcluÃ­do   |
| Mariana Costa         | 307           | Em Andamento |
| Mariana Costa         | 330           | Entregue     |
| Mariana Costa         | 353           | ConcluÃ­do   |
| Mariana Costa         | 359           | ConcluÃ­do   |
| Mariana Costa         | 385           | Em Andamento |
| Mariana Costa         | 408           | Entregue     |
| Mariana Costa         | 431           | ConcluÃ­do   |
| Luís Carlos Sousa     | 26            | Entregue     |
| Luís Carlos Sousa     | 71            | Entregue     |
| Luís Carlos Sousa     | 97            | Entregue     |
| Luís Carlos Sousa     | 123           | Entregue     |
| Luís Carlos Sousa     | 149           | ConcluÃ­do   |
| Luís Carlos Sousa     | 172           | Entregue     |
| Luís Carlos Sousa     | 198           | ConcluÃ­do   |
| Luís Carlos Sousa     | 221           | Entregue     |
| Luís Carlos Sousa     | 247           | ConcluÃ­do   |
| Luís Carlos Sousa     | 270           | Em Andamento |
| Luís Carlos Sousa     | 297           | Entregue     |
| Luís Carlos Sousa     | 323           | ConcluÃ­do   |
| Luís Carlos Sousa     | 346           | Em Andamento |
| Luís Carlos Sousa     | 375           | Entregue     |
| Luís Carlos Sousa     | 401           | ConcluÃ­do   |
| Luís Carlos Sousa     | 424           | Em Andamento |
| Luís Carlos Sousa     | 447           | Entregue     |
| Silvia Ribeiro        | 14            | Entregue     |
| Silvia Ribeiro        | 39            | Em Andamento |
| Silvia Ribeiro        | 60            | Em Andamento |
| Silvia Ribeiro        | 86            | Em Andamento |
| Silvia Ribeiro        | 112           | Em Andamento |
| Silvia Ribeiro        | 138           | Entregue     |
| Silvia Ribeiro        | 161           | Em Andamento |
| Silvia Ribeiro        | 187           | Entregue     |
| Silvia Ribeiro        | 210           | Em Andamento |
| Silvia Ribeiro        | 236           | Entregue     |
| Silvia Ribeiro        | 259           | ConcluÃ­do   |
| Silvia Ribeiro        | 286           | Em Andamento |
| Silvia Ribeiro        | 312           | Entregue     |
| Silvia Ribeiro        | 335           | ConcluÃ­do   |
| Silvia Ribeiro        | 364           | Em Andamento |
| Silvia Ribeiro        | 390           | Entregue     |
| Silvia Ribeiro        | 413           | ConcluÃ­do   |
| Silvia Ribeiro        | 436           | Em Andamento |
| Artur Santos          | 15            | Em Andamento |
| Artur Santos          | 45            | Em Andamento |
| Artur Santos          | 64            | ConcluÃ­do   |
| Artur Santos          | 90            | ConcluÃ­do   |
| Artur Santos          | 116           | ConcluÃ­do   |
| Artur Santos          | 142           | Em Andamento |
| Artur Santos          | 165           | ConcluÃ­do   |
| Artur Santos          | 191           | Em Andamento |
| Artur Santos          | 214           | ConcluÃ­do   |
| Artur Santos          | 240           | Em Andamento |
| Artur Santos          | 263           | Entregue     |
| Artur Santos          | 290           | ConcluÃ­do   |
| Artur Santos          | 316           | Em Andamento |
| Artur Santos          | 339           | Entregue     |
| Artur Santos          | 368           | ConcluÃ­do   |
| Artur Santos          | 394           | Em Andamento |
| Artur Santos          | 417           | Entregue     |
| Artur Santos          | 440           | ConcluÃ­do   |
| Arya Santos           | 17            | Entregue     |
| Arya Santos           | 40            | ConcluÃ­do   |
| Arya Santos           | 74            | Entregue     |
| Arya Santos           | 100           | Entregue     |
| Arya Santos           | 126           | Entregue     |
| Arya Santos           | 175           | Entregue     |
| Arya Santos           | 224           | Entregue     |
| Arya Santos           | 300           | Entregue     |
| Arya Santos           | 378           | Entregue     |
| Carolina Lima         | 23            | Entregue     |
| Carolina Lima         | 41            | Entregue     |
| Carolina Lima         | 65            | Entregue     |
| Carolina Lima         | 91            | Entregue     |
| Carolina Lima         | 117           | Entregue     |
| Carolina Lima         | 143           | ConcluÃ­do   |
| Carolina Lima         | 166           | Entregue     |
| Carolina Lima         | 192           | ConcluÃ­do   |
| Carolina Lima         | 215           | Entregue     |
| Carolina Lima         | 241           | ConcluÃ­do   |
| Carolina Lima         | 264           | Em Andamento |
| Carolina Lima         | 291           | Entregue     |
| Carolina Lima         | 317           | ConcluÃ­do   |
| Carolina Lima         | 340           | Em Andamento |
| Carolina Lima         | 369           | Entregue     |
| Carolina Lima         | 395           | ConcluÃ­do   |
| Carolina Lima         | 418           | Em Andamento |
| Carolina Lima         | 441           | Entregue     |
| Pedro Almeida         | 13            | ConcluÃ­do   |
| Pedro Almeida         | 46            | ConcluÃ­do   |
| Pedro Almeida         | 62            | Entregue     |
| Pedro Almeida         | 88            | Entregue     |
| Pedro Almeida         | 114           | Entregue     |
| Pedro Almeida         | 140           | ConcluÃ­do   |
| Pedro Almeida         | 163           | Entregue     |
| Pedro Almeida         | 189           | ConcluÃ­do   |
| Pedro Almeida         | 212           | Entregue     |
| Pedro Almeida         | 238           | ConcluÃ­do   |
| Pedro Almeida         | 261           | Em Andamento |
| Pedro Almeida         | 288           | Entregue     |
| Pedro Almeida         | 314           | ConcluÃ­do   |
| Pedro Almeida         | 337           | Em Andamento |
| Pedro Almeida         | 366           | Entregue     |
| Pedro Almeida         | 392           | ConcluÃ­do   |
| Pedro Almeida         | 415           | Em Andamento |
| Pedro Almeida         | 438           | Entregue     |
| Inês Gonçalves        | 19            | ConcluÃ­do   |
| Inês Gonçalves        | 49            | ConcluÃ­do   |
| Inês Gonçalves        | 72            | Em Andamento |
| Inês Gonçalves        | 98            | Em Andamento |
| Inês Gonçalves        | 124           | Em Andamento |
| Inês Gonçalves        | 150           | Em Andamento |
| Inês Gonçalves        | 173           | Em Andamento |
| Inês Gonçalves        | 199           | Entregue     |
| Inês Gonçalves        | 222           | Em Andamento |
| Inês Gonçalves        | 248           | Entregue     |
| Inês Gonçalves        | 271           | ConcluÃ­do   |
| Inês Gonçalves        | 298           | Em Andamento |
| Inês Gonçalves        | 324           | Entregue     |
| Inês Gonçalves        | 347           | ConcluÃ­do   |
| Inês Gonçalves        | 376           | Em Andamento |
| Inês Gonçalves        | 402           | Entregue     |
| Inês Gonçalves        | 425           | ConcluÃ­do   |
| Inês Gonçalves        | 448           | Em Andamento |
| Rui Santos            | 25            | ConcluÃ­do   |
| Rui Santos            | 47            | Entregue     |
| Rui Santos            | 70            | ConcluÃ­do   |
| Rui Santos            | 96            | ConcluÃ­do   |
| Rui Santos            | 122           | ConcluÃ­do   |
| Rui Santos            | 148           | Em Andamento |
| Rui Santos            | 171           | ConcluÃ­do   |
| Rui Santos            | 197           | Em Andamento |
| Rui Santos            | 220           | ConcluÃ­do   |
| Rui Santos            | 246           | Em Andamento |
| Rui Santos            | 269           | Entregue     |
| Rui Santos            | 296           | ConcluÃ­do   |
| Rui Santos            | 322           | Em Andamento |
| Rui Santos            | 345           | Entregue     |
| Rui Santos            | 374           | ConcluÃ­do   |
| Rui Santos            | 400           | Em Andamento |
| Rui Santos            | 423           | Entregue     |
| Rui Santos            | 446           | ConcluÃ­do   |
| Diogo Fernandes       | 7             | Em Andamento |
| Diogo Fernandes       | 31            | ConcluÃ­do   |
| Diogo Fernandes       | 76            | ConcluÃ­do   |
| Diogo Fernandes       | 102           | ConcluÃ­do   |
| Diogo Fernandes       | 128           | ConcluÃ­do   |
| Diogo Fernandes       | 177           | ConcluÃ­do   |
| Diogo Fernandes       | 226           | ConcluÃ­do   |
| Diogo Fernandes       | 302           | ConcluÃ­do   |
| Diogo Fernandes       | 380           | ConcluÃ­do   |
| Helena Lima           | 10            | Em Andamento |
| Helena Lima           | 37            | ConcluÃ­do   |
| Helena Lima           | 57            | Em Andamento |
| Helena Lima           | 83            | Em Andamento |
| Helena Lima           | 109           | Em Andamento |
| Helena Lima           | 135           | Entregue     |
| Helena Lima           | 158           | Em Andamento |
| Helena Lima           | 184           | Entregue     |
| Helena Lima           | 207           | Em Andamento |
| Helena Lima           | 233           | Entregue     |
| Helena Lima           | 256           | ConcluÃ­do   |
| Helena Lima           | 283           | Em Andamento |
| Helena Lima           | 309           | Entregue     |
| Helena Lima           | 332           | ConcluÃ­do   |
| Helena Lima           | 361           | Em Andamento |
| Helena Lima           | 387           | Entregue     |
| Helena Lima           | 410           | ConcluÃ­do   |
| Helena Lima           | 433           | Em Andamento |
| Paulo Sousa           |               |              |
| João Santos           |               |              |
| Carla Ferreira        |               |              |

---
**Query #5**

    -- Útil para descobrir clientes que NUNCA fizeram um pedido.
    
    
    -- --------------------------------------------------
    -- 2.3  JOIN em 3 tabelas — unindo tudo
    -- --------------------------------------------------
    -- Pergunta real: "Quais produtos cada cliente pediu e quanto pagou?"
    
    SELECT
        c.nome                                        AS cliente,
        pr.nome                                       AS produto,
        pr.categoria,
        ip.quantidade,
        ip.precounitario,
        (ip.quantidade * ip.precounitario)            AS subtotal
    FROM pedidos          AS p
    INNER JOIN clientes   AS c   ON p.idcliente  = c.id
    INNER JOIN itenspedidos AS ip ON ip.idpedido = p.id
    INNER JOIN produtos   AS pr  ON ip.idproduto = pr.id;

There are no results to be displayed.

---
**Query #6**

    -- Três "pontes" encadeadas: pedidos → clientes, pedidos → itenspedidos → produtos.
    
    
    -- ============================================================
    -- PARTE 3 — WHERE vs. HAVING: OS DOIS FILTROS
    -- ============================================================
    
    -- --------------------------------------------------
    -- 3.1  WHERE — filtra ANTES do agrupamento (linha a linha)
    -- --------------------------------------------------
    -- Pergunta: "Quais pedidos estão com status 'entregue'?"
    
    SELECT
        p.id            AS pedido,
        c.nome          AS cliente,
        p.datahorapedido,
        p.status
    FROM pedidos   AS p
    INNER JOIN clientes AS c ON p.idcliente = c.id
    WHERE p.status = 'entregue';

| pedido | cliente               | datahorapedido      | status   |
| ------ | --------------------- | ------------------- | -------- |
| 6      | Maria Silva           | 2023-01-02 12:45:00 | Entregue |
| 260    | Maria Silva           | 2023-07-23 08:45:00 | Entregue |
| 336    | Maria Silva           | 2023-08-23 08:45:00 | Entregue |
| 414    | Maria Silva           | 2023-09-23 08:45:00 | Entregue |
| 20     | João Pereira          | 2023-01-18 10:30:00 | Entregue |
| 29     | João Pereira          | 2023-02-01 11:15:00 | Entregue |
| 132    | João Pereira          | 2023-05-15 12:00:00 | Entregue |
| 181    | João Pereira          | 2023-06-10 12:00:00 | Entregue |
| 230    | João Pereira          | 2023-07-10 12:00:00 | Entregue |
| 306    | João Pereira          | 2023-08-10 12:00:00 | Entregue |
| 384    | João Pereira          | 2023-09-10 12:00:00 | Entregue |
| 38     | Ana Rodrigues         | 2023-02-07 10:45:00 | Entregue |
| 147    | Ana Rodrigues         | 2023-05-30 08:15:00 | Entregue |
| 196    | Ana Rodrigues         | 2023-06-15 08:15:00 | Entregue |
| 245    | Ana Rodrigues         | 2023-07-15 08:15:00 | Entregue |
| 321    | Ana Rodrigues         | 2023-08-15 08:15:00 | Entregue |
| 399    | Ana Rodrigues         | 2023-09-15 08:15:00 | Entregue |
| 53     | Pedro Alves           | 2023-03-01 11:45:00 | Entregue |
| 79     | Pedro Alves           | 2023-04-01 11:45:00 | Entregue |
| 105    | Pedro Alves           | 2023-05-01 11:45:00 | Entregue |
| 154    | Pedro Alves           | 2023-06-01 11:45:00 | Entregue |
| 203    | Pedro Alves           | 2023-07-01 11:45:00 | Entregue |
| 275    | Pedro Alves           | 2023-07-30 11:45:00 | Entregue |
| 279    | Pedro Alves           | 2023-08-01 11:45:00 | Entregue |
| 351    | Pedro Alves           | 2023-08-30 11:45:00 | Entregue |
| 357    | Pedro Alves           | 2023-09-01 11:45:00 | Entregue |
| 429    | Pedro Alves           | 2023-09-30 11:45:00 | Entregue |
| 44     | Sofia Santos          | 2023-02-12 10:30:00 | Entregue |
| 257    | Sofia Santos          | 2023-07-22 08:30:00 | Entregue |
| 333    | Sofia Santos          | 2023-08-22 08:30:00 | Entregue |
| 411    | Sofia Santos          | 2023-09-22 08:30:00 | Entregue |
| 50     | Jorge Lima            | 2023-02-18 12:00:00 | Entregue |
| 151    | Jorge Lima            | 2023-05-30 09:45:00 | Entregue |
| 272    | Jorge Lima            | 2023-07-26 09:45:00 | Entregue |
| 348    | Jorge Lima            | 2023-08-26 09:45:00 | Entregue |
| 426    | Jorge Lima            | 2023-09-26 09:45:00 | Entregue |
| 32     | Luisa Ferreira        | 2023-02-05 08:15:00 | Entregue |
| 144    | Luisa Ferreira        | 2023-05-25 10:45:00 | Entregue |
| 193    | Luisa Ferreira        | 2023-06-14 10:45:00 | Entregue |
| 242    | Luisa Ferreira        | 2023-07-14 10:45:00 | Entregue |
| 318    | Luisa Ferreira        | 2023-08-14 10:45:00 | Entregue |
| 396    | Luisa Ferreira        | 2023-09-14 10:45:00 | Entregue |
| 3      | Carlos Gomes          | 2023-01-02 09:30:00 | Entregue |
| 129    | Carlos Gomes          | 2023-05-15 08:15:00 | Entregue |
| 178    | Carlos Gomes          | 2023-06-10 08:15:00 | Entregue |
| 227    | Carlos Gomes          | 2023-07-10 08:15:00 | Entregue |
| 303    | Carlos Gomes          | 2023-08-10 08:15:00 | Entregue |
| 381    | Carlos Gomes          | 2023-09-10 08:15:00 | Entregue |
| 450    | Carlos Gomes          | 2023-10-06 10:30:00 | Entregue |
| 59     | Marta Ribeiro         | 2023-03-03 10:45:00 | Entregue |
| 85     | Marta Ribeiro         | 2023-04-03 10:45:00 | Entregue |
| 111    | Marta Ribeiro         | 2023-05-03 10:45:00 | Entregue |
| 160    | Marta Ribeiro         | 2023-06-03 10:45:00 | Entregue |
| 209    | Marta Ribeiro         | 2023-07-03 10:45:00 | Entregue |
| 285    | Marta Ribeiro         | 2023-08-03 10:45:00 | Entregue |
| 363    | Marta Ribeiro         | 2023-09-03 10:45:00 | Entregue |
| 435    | Marta Ribeiro         | 2023-10-02 10:45:00 | Entregue |
| 251    | Ana Maria Silva       | 2023-07-20 10:30:00 | Entregue |
| 327    | Ana Maria Silva       | 2023-08-20 10:30:00 | Entregue |
| 405    | Ana Maria Silva       | 2023-09-20 10:30:00 | Entregue |
| 35     | André Almeida         | 2023-02-06 10:15:00 | Entregue |
| 266    | André Almeida         | 2023-07-25 11:00:00 | Entregue |
| 342    | André Almeida         | 2023-08-25 11:00:00 | Entregue |
| 420    | André Almeida         | 2023-09-25 11:00:00 | Entregue |
| 9      | João Carlos Rodrigues | 2023-01-06 09:30:00 | Entregue |
| 56     | João Carlos Rodrigues | 2023-03-02 10:15:00 | Entregue |
| 82     | João Carlos Rodrigues | 2023-04-02 10:15:00 | Entregue |
| 108    | João Carlos Rodrigues | 2023-05-02 10:15:00 | Entregue |
| 157    | João Carlos Rodrigues | 2023-06-02 10:15:00 | Entregue |
| 206    | João Carlos Rodrigues | 2023-07-02 10:15:00 | Entregue |
| 282    | João Carlos Rodrigues | 2023-08-02 10:15:00 | Entregue |
| 354    | João Carlos Rodrigues | 2023-08-31 10:15:00 | Entregue |
| 360    | João Carlos Rodrigues | 2023-09-02 10:15:00 | Entregue |
| 432    | João Carlos Rodrigues | 2023-10-01 10:15:00 | Entregue |
| 68     | Isabela Pereira       | 2023-03-06 12:30:00 | Entregue |
| 94     | Isabela Pereira       | 2023-04-06 12:30:00 | Entregue |
| 120    | Isabela Pereira       | 2023-05-05 12:30:00 | Entregue |
| 169    | Isabela Pereira       | 2023-06-06 12:30:00 | Entregue |
| 218    | Isabela Pereira       | 2023-07-06 12:30:00 | Entregue |
| 294    | Isabela Pereira       | 2023-08-06 12:30:00 | Entregue |
| 372    | Isabela Pereira       | 2023-09-06 12:30:00 | Entregue |
| 444    | Isabela Pereira       | 2023-10-05 12:30:00 | Entregue |
| 141    | Ricardo Ferreira      | 2023-05-20 10:00:00 | Entregue |
| 190    | Ricardo Ferreira      | 2023-06-13 10:00:00 | Entregue |
| 239    | Ricardo Ferreira      | 2023-07-13 10:00:00 | Entregue |
| 315    | Ricardo Ferreira      | 2023-08-13 10:00:00 | Entregue |
| 393    | Ricardo Ferreira      | 2023-09-13 10:00:00 | Entregue |
| 254    | Mariana Costa         | 2023-07-21 09:00:00 | Entregue |
| 330    | Mariana Costa         | 2023-08-21 09:00:00 | Entregue |
| 408    | Mariana Costa         | 2023-09-21 09:00:00 | Entregue |
| 26     | Luís Carlos Sousa     | 2023-01-26 12:30:00 | Entregue |
| 71     | Luís Carlos Sousa     | 2023-03-07 10:30:00 | Entregue |
| 97     | Luís Carlos Sousa     | 2023-04-07 10:30:00 | Entregue |
| 123    | Luís Carlos Sousa     | 2023-05-06 10:30:00 | Entregue |
| 172    | Luís Carlos Sousa     | 2023-06-07 10:30:00 | Entregue |
| 221    | Luís Carlos Sousa     | 2023-07-07 10:30:00 | Entregue |
| 297    | Luís Carlos Sousa     | 2023-08-07 10:30:00 | Entregue |
| 375    | Luís Carlos Sousa     | 2023-09-07 10:30:00 | Entregue |
| 447    | Luís Carlos Sousa     | 2023-10-05 10:30:00 | Entregue |
| 14     | Silvia Ribeiro        | 2023-01-12 09:45:00 | Entregue |
| 138    | Silvia Ribeiro        | 2023-05-20 12:15:00 | Entregue |
| 187    | Silvia Ribeiro        | 2023-06-12 12:15:00 | Entregue |
| 236    | Silvia Ribeiro        | 2023-07-12 12:15:00 | Entregue |
| 312    | Silvia Ribeiro        | 2023-08-12 12:15:00 | Entregue |
| 390    | Silvia Ribeiro        | 2023-09-12 12:15:00 | Entregue |
| 263    | Artur Santos          | 2023-07-24 08:00:00 | Entregue |
| 339    | Artur Santos          | 2023-08-24 08:00:00 | Entregue |
| 417    | Artur Santos          | 2023-09-24 08:00:00 | Entregue |
| 17     | Arya Santos           | 2023-01-12 12:15:00 | Entregue |
| 74     | Arya Santos           | 2023-03-08 11:15:00 | Entregue |
| 100    | Arya Santos           | 2023-04-08 11:15:00 | Entregue |
| 126    | Arya Santos           | 2023-05-07 11:15:00 | Entregue |
| 175    | Arya Santos           | 2023-06-08 11:15:00 | Entregue |
| 224    | Arya Santos           | 2023-07-08 11:15:00 | Entregue |
| 300    | Arya Santos           | 2023-08-08 11:15:00 | Entregue |
| 378    | Arya Santos           | 2023-09-08 11:15:00 | Entregue |
| 23     | Carolina Lima         | 2023-01-22 10:45:00 | Entregue |
| 41     | Carolina Lima         | 2023-02-10 09:30:00 | Entregue |
| 65     | Carolina Lima         | 2023-03-05 09:30:00 | Entregue |
| 91     | Carolina Lima         | 2023-04-05 09:30:00 | Entregue |
| 117    | Carolina Lima         | 2023-05-04 09:30:00 | Entregue |
| 166    | Carolina Lima         | 2023-06-05 09:30:00 | Entregue |
| 215    | Carolina Lima         | 2023-07-05 09:30:00 | Entregue |
| 291    | Carolina Lima         | 2023-08-05 09:30:00 | Entregue |
| 369    | Carolina Lima         | 2023-09-05 09:30:00 | Entregue |
| 441    | Carolina Lima         | 2023-10-04 09:30:00 | Entregue |
| 62     | Pedro Almeida         | 2023-03-04 09:15:00 | Entregue |
| 88     | Pedro Almeida         | 2023-04-04 09:15:00 | Entregue |
| 114    | Pedro Almeida         | 2023-05-03 09:15:00 | Entregue |
| 163    | Pedro Almeida         | 2023-06-04 09:15:00 | Entregue |
| 212    | Pedro Almeida         | 2023-07-04 09:15:00 | Entregue |
| 288    | Pedro Almeida         | 2023-08-04 09:15:00 | Entregue |
| 366    | Pedro Almeida         | 2023-09-04 09:15:00 | Entregue |
| 438    | Pedro Almeida         | 2023-10-03 09:15:00 | Entregue |
| 199    | Inês Gonçalves        | 2023-06-16 08:00:00 | Entregue |
| 248    | Inês Gonçalves        | 2023-07-16 08:00:00 | Entregue |
| 324    | Inês Gonçalves        | 2023-08-16 08:00:00 | Entregue |
| 402    | Inês Gonçalves        | 2023-09-16 08:00:00 | Entregue |
| 47     | Rui Santos            | 2023-02-15 09:15:00 | Entregue |
| 269    | Rui Santos            | 2023-07-25 09:00:00 | Entregue |
| 345    | Rui Santos            | 2023-08-25 09:00:00 | Entregue |
| 423    | Rui Santos            | 2023-09-25 09:00:00 | Entregue |
| 135    | Helena Lima           | 2023-05-15 11:30:00 | Entregue |
| 184    | Helena Lima           | 2023-06-11 11:30:00 | Entregue |
| 233    | Helena Lima           | 2023-07-11 11:30:00 | Entregue |
| 309    | Helena Lima           | 2023-08-11 11:30:00 | Entregue |
| 387    | Helena Lima           | 2023-09-11 11:30:00 | Entregue |

---
**Query #7**

    -- ← filtra ANTES de qualquer cálculo
    -- O banco descarta as linhas que não batem com o filtro logo no início.
    
    
    -- --------------------------------------------------
    -- 3.2  GROUP BY + SUM — agrupando para calcular totais
    -- --------------------------------------------------
    -- Pergunta: "Qual o total gasto por cada cliente?"
    
    SELECT
        c.nome                                    AS cliente,
        SUM(ip.quantidade * ip.precounitario)     AS total_gasto
    FROM pedidos            AS p
    INNER JOIN clientes     AS c   ON p.idcliente  = c.id
    INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
    GROUP BY c.nome;

There are no results to be displayed.

---
**Query #8**

    -- ← agrupa todas as linhas do mesmo cliente
    -- ✔ SUM soma os valores dentro de cada grupo.
    
    
    -- --------------------------------------------------
    -- 3.3  HAVING — filtra APÓS o agrupamento (sobre o resultado agregado)
    -- --------------------------------------------------
    -- Pergunta: "Quais clientes gastaram MAIS DE R$ 10,00 no total?"
    
    SELECT
        c.nome                                    AS cliente,
        SUM(ip.quantidade * ip.precounitario)     AS total_gasto
    FROM pedidos            AS p
    INNER JOIN clientes     AS c   ON p.idcliente  = c.id
    INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
    GROUP BY c.nome
    HAVING total_gasto > 10.00;

There are no results to be displayed.

---
**Query #9**

    -- ← filtra DEPOIS do GROUP BY
    -- WHERE não pode usar "total_gasto" (ainda não existe nesse ponto da execução).
    -- HAVING sim, porque ele age após a agregação.
    
    
    -- --------------------------------------------------
    -- 3.4  WHERE + HAVING juntos
    -- --------------------------------------------------
    -- Pergunta: "Quais clientes com pedidos 'pendente' gastaram mais de R$ 5,00?"
    
    SELECT
        c.nome                                    AS cliente,
        SUM(ip.quantidade * ip.precounitario)     AS total_gasto
    FROM pedidos            AS p
    INNER JOIN clientes     AS c   ON p.idcliente  = c.id
    INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
    WHERE  p.status = 'pendente'       -- 1º filtro: só pedidos pendentes
    GROUP BY c.nome
    HAVING total_gasto > 5.00;

There are no results to be displayed.

---
**Query #10**

    -- 2º filtro: só quem gastou mais de R$5
    -- Ordem de execução: FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT
    
    
    -- ============================================================
    -- PARTE 4 — OPERAÇÕES DE CONJUNTO
    -- ============================================================
    
    -- --------------------------------------------------
    -- 4.1  UNION — combina resultados, remove duplicatas
    -- --------------------------------------------------
    -- Analogia: "Liste todos os e-mails de contato da cafeteria
    --            (clientes + colaboradores), sem repetir."
    
    SELECT email, 'Cliente'      AS tipo FROM clientes      WHERE email <> 'Sem email'
    UNION
    SELECT email, 'Colaborador'  AS tipo FROM colaboradores;

| email                      | tipo        |
| -------------------------- | ----------- |
| maria.silva@email.com      | Cliente     |
| joao.pereira@email.com     | Cliente     |
| ana.rodrigues@email.com    | Cliente     |
| pedro.alves@email.com      | Cliente     |
| sofia.santos@email.com     | Cliente     |
| jorge.lima@email.com       | Cliente     |
| luisa.ferreira@email.com   | Cliente     |
| carlos.gomes@email.com     | Cliente     |
| marta.ribeiro@email.com    | Cliente     |
| ana.silva@email.com        | Cliente     |
| joao.rodrigues@email.com   | Cliente     |
| isabel.goncalves@email.com | Cliente     |
| ricardo.ferreira@email.com | Cliente     |
| mariana.costa@email.com    | Cliente     |
| luis.sousa@email.com       | Cliente     |
| silvia.ribeiro@email.com   | Cliente     |
| artur.santos@email.com     | Cliente     |
| arya.santos@email.com      | Cliente     |
| carolina.lima@email.com    | Cliente     |
| pedro.almeida@email.com    | Cliente     |
| ines.goncalves@email.com   | Cliente     |
| diogo.fernandes@email.com  | Cliente     |
| joao.santos@email.com      | Cliente     |
| carla.ferreira@email.com   | Cliente     |
| carlos.silva@email.com     | Colaborador |
| marta.sousa@email.com      | Colaborador |
| pedro.almeida@email.com    | Colaborador |
| sofia.rodrigues@email.com  | Colaborador |
| joao.pereira@email.com     | Colaborador |
| ines.lima@email.com        | Colaborador |
| antonio.artur@email.com    | Colaborador |

---
**Query #11**

    -- UNION elimina linhas idênticas automaticamente.
    -- UNION ALL manteria duplicatas (mais rápido quando você sabe que não há).
    
    
    -- --------------------------------------------------
    -- 4.2  INTERSECT (simulado com INNER JOIN no MySQL)
    -- --------------------------------------------------
    -- Objetivo: "Quais nomes aparecem tanto em clientes quanto em colaboradores?"
    -- (MySQL não tem INTERSECT nativo — usamos INNER JOIN como equivalente)
    
    SELECT DISTINCT c.nome
    FROM clientes      AS c
    INNER JOIN colaboradores AS col ON c.nome = col.nome;

| nome          |
| ------------- |
| João Pereira  |
| Pedro Almeida |

---
**Query #12**

    -- Retorna apenas nomes que existem nas DUAS tabelas.
    -- Dica: Em bancos que suportam (PostgreSQL, Oracle), seria:
    --   SELECT nome FROM clientes
    --   INTERSECT
    --   SELECT nome FROM colaboradores;
    
    
    -- --------------------------------------------------
    -- 4.3  EXCEPT / MINUS (simulado com LEFT JOIN no MySQL)
    -- --------------------------------------------------
    -- Objetivo: "Quais clientes NUNCA foram colaboradores?"
    
    SELECT c.nome
    FROM clientes       AS c
    LEFT JOIN colaboradores AS col ON c.nome = col.nome
    WHERE col.id IS NULL;

| nome                  |
| --------------------- |
| Maria Silva           |
| Ana Rodrigues         |
| Pedro Alves           |
| Sofia Santos          |
| Jorge Lima            |
| Luisa Ferreira        |
| Carlos Gomes          |
| Marta Ribeiro         |
| Ana Maria Silva       |
| André Almeida         |
| João Carlos Rodrigues |
| Isabela Pereira       |
| Isabel Gonçalves      |
| Ricardo Ferreira      |
| Mariana Costa         |
| Luís Carlos Sousa     |
| Silvia Ribeiro        |
| Artur Santos          |
| Arya Santos           |
| Carolina Lima         |
| Inês Gonçalves        |
| Rui Santos            |
| Diogo Fernandes       |
| Helena Lima           |
| Paulo Sousa           |
| João Santos           |
| Carla Ferreira        |

---
**Query #13**

    -- ← NULL significa "não encontrou par"
    -- LEFT JOIN traz todos os clientes; WHERE col.id IS NULL filtra
    --   apenas os que NÃO têm correspondente na tabela colaboradores.
    -- Dica: Em bancos nativos (PostgreSQL):
    --   SELECT nome FROM clientes
    --   EXCEPT
    --   SELECT nome FROM colaboradores;
    
    
    -- ============================================================
    -- PARTE 5 — DESAFIO PRÁTICO (adaptado para a Cafeteria)
    -- ============================================================
    
    -- Tarefa: "Identificar clientes cujo valor total de pedidos
    --          seja superior a R$ 15,00, exibindo o total por categoria."
    
    SELECT
        c.nome                                    AS cliente,
        pr.categoria,
        SUM(ip.quantidade * ip.precounitario)     AS total_por_categoria
    FROM pedidos            AS p
    INNER JOIN clientes     AS c   ON p.idcliente  = c.id
    INNER JOIN itenspedidos AS ip  ON ip.idpedido  = p.id
    INNER JOIN produtos     AS pr  ON ip.idproduto = pr.id
    GROUP BY c.nome, pr.categoria
    HAVING total_por_categoria > 15.00
    ORDER BY total_por_categoria DESC;

There are no results to be displayed.

---
**Query #14**

    -- ordena do maior para o menor
    -- ORDER BY DESC: do maior para o menor.
    -- Agrupamos por (cliente + categoria) para ver onde cada um mais gasta.
    
    
    -- ============================================================
    -- PARTE 6 — OTIMIZAÇÃO: PENSANDO COMO PROFISSIONAL
    -- ============================================================
    
    -- --------------------------------------------------
    -- 6.1  Evite SELECT * — peça só o que precisa
    -- --------------------------------------------------
    
    -- RUIM: trafega todas as colunas (muitas desnecessárias)
    SELECT * FROM clientes;

| id  | nome                  | telefone   | email                      | endereco                               |
| --- | --------------------- | ---------- | -------------------------- | -------------------------------------- |
| 1   | Maria Silva           | 115551234  | maria.silva@email.com      | Rua das Flores, 123, Cidade A          |
| 2   | João Pereira          | 215555678  | joao.pereira@email.com     | Av. Principal, 456, Cidade B           |
| 3   | Ana Rodrigues         | 315557890  | ana.rodrigues@email.com    | Rua Central, 789, Cidade C             |
| 4   | Pedro Alves           | 415552345  | pedro.alves@email.com      | Travessa dos Sonhos, 56, Cidade D      |
| 5   | Sofia Santos          | 515558765  | sofia.santos@email.com     | Alameda das Artes, 321, Cidade E       |
| 6   | Jorge Lima            | 615553421  | jorge.lima@email.com       | Praça das Estrelas, 987, Cidade F      |
| 7   | Luisa Ferreira        | 715559876  | luisa.ferreira@email.com   | Rua das Palmeiras, 789, Cidade G       |
| 8   | Carlos Gomes          | 815552345  | carlos.gomes@email.com     | Avenida dos Ventos, 123, Cidade H      |
| 9   | Marta Ribeiro         | 915555432  | marta.ribeiro@email.com    | Travessa das Maravilhas, 56, Cidade I  |
| 10  | Ana Maria Silva       | 1515557890 | ana.silva@email.com        | Rua Central, 567, Cidade O             |
| 11  | André Almeida         | 1015556789 | Sem email                  | Praça da Felicidade, 456, Cidade J     |
| 12  | João Carlos Rodrigues | 1615552345 | joao.rodrigues@email.com   | Praça dos Poetas, 321, Cidade P        |
| 13  | Isabela Pereira       | 1115558765 | Sem email                  | Rua das Araras, 789, Cidade K          |
| 14  | Isabel Gonçalves      | 1715558765 | isabel.goncalves@email.com | Alameda das Gaivotas, 654, Cidade Q    |
| 15  | Ricardo Ferreira      | 1815554321 | ricardo.ferreira@email.com | Avenida da Paz, 987, Cidade R          |
| 16  | Mariana Costa         | 1915551234 | mariana.costa@email.com    | Travessa das Mariposas, 234, Cidade S  |
| 17  | Luís Carlos Sousa     | 2015555678 | luis.sousa@email.com       | Rua dos Sonhos, 456, Cidade T          |
| 18  | Silvia Ribeiro        | 2115557890 | silvia.ribeiro@email.com   | Alameda dos Sorrisos, 765, Cidade U    |
| 19  | Artur Santos          | 2215552345 | artur.santos@email.com     | Praça das Alegrias, 987, Cidade V      |
| 20  | Arya Santos           | 2215552852 | arya.santos@email.com      | Rua Gloriosa, 96, Cidade V             |
| 21  | Carolina Lima         | 2315558765 | carolina.lima@email.com    | Avenida da Felicidade, 654, Cidade W   |
| 22  | Pedro Almeida         | 2415554321 | pedro.almeida@email.com    | Rua das Estrelas, 123, Cidade X        |
| 23  | Inês Gonçalves        | 2515551234 | ines.goncalves@email.com   | Travessa das Maravilhas, 234, Cidade Y |
| 24  | Rui Santos            | 1215554321 | Sem email                  | Alameda das Estrelas, 654, Cidade L    |
| 25  | Diogo Fernandes       | 2615555678 | diogo.fernandes@email.com  | Praça dos Desejos, 987, Cidade Z       |
| 26  | Helena Lima           | 1315551234 | Sem email                  | Avenida dos Sonhos, 234, Cidade M      |
| 27  | Paulo Sousa           | 1415555678 | Sem email                  | Travessa das Marés, 876, Cidade N      |
| 28  | João Santos           | 215555678  | joao.santos@email.com      | Avenida Principal, 456, Cidade B       |
| 29  | Carla Ferreira        | 315557890  | carla.ferreira@email.com   | Travessa das Ruas, 789, Cidade C       |

---
**Query #15**

    -- BOM: apenas as colunas necessárias
    SELECT id, nome, email FROM clientes;

| id  | nome                  | email                      |
| --- | --------------------- | -------------------------- |
| 1   | Maria Silva           | maria.silva@email.com      |
| 2   | João Pereira          | joao.pereira@email.com     |
| 3   | Ana Rodrigues         | ana.rodrigues@email.com    |
| 4   | Pedro Alves           | pedro.alves@email.com      |
| 5   | Sofia Santos          | sofia.santos@email.com     |
| 6   | Jorge Lima            | jorge.lima@email.com       |
| 7   | Luisa Ferreira        | luisa.ferreira@email.com   |
| 8   | Carlos Gomes          | carlos.gomes@email.com     |
| 9   | Marta Ribeiro         | marta.ribeiro@email.com    |
| 10  | Ana Maria Silva       | ana.silva@email.com        |
| 11  | André Almeida         | Sem email                  |
| 12  | João Carlos Rodrigues | joao.rodrigues@email.com   |
| 13  | Isabela Pereira       | Sem email                  |
| 14  | Isabel Gonçalves      | isabel.goncalves@email.com |
| 15  | Ricardo Ferreira      | ricardo.ferreira@email.com |
| 16  | Mariana Costa         | mariana.costa@email.com    |
| 17  | Luís Carlos Sousa     | luis.sousa@email.com       |
| 18  | Silvia Ribeiro        | silvia.ribeiro@email.com   |
| 19  | Artur Santos          | artur.santos@email.com     |
| 20  | Arya Santos           | arya.santos@email.com      |
| 21  | Carolina Lima         | carolina.lima@email.com    |
| 22  | Pedro Almeida         | pedro.almeida@email.com    |
| 23  | Inês Gonçalves        | ines.goncalves@email.com   |
| 24  | Rui Santos            | Sem email                  |
| 25  | Diogo Fernandes       | diogo.fernandes@email.com  |
| 26  | Helena Lima           | Sem email                  |
| 27  | Paulo Sousa           | Sem email                  |
| 28  | João Santos           | joao.santos@email.com      |
| 29  | Carla Ferreira        | carla.ferreira@email.com   |

---
**Query #16**

    -- --------------------------------------------------
    -- 6.2  INDEX — criando "índices" para acelerar buscas
    -- --------------------------------------------------
    -- Analogia: o índice de um livro — você vai direto ao assunto,
    --           sem ler página por página.
    
    -- Índice na coluna usada em JOIN (idcliente em pedidos):
    CREATE INDEX idx_pedidos_idcliente ON pedidos (idcliente);

There are no results to be displayed.

---
**Query #17**

    -- Índice em coluna usada em WHERE (status):
    CREATE INDEX idx_pedidos_status    ON pedidos (status);

There are no results to be displayed.

---
**Query #18**

    -- Índice em coluna usada em WHERE/JOIN em itenspedidos:
    CREATE INDEX idx_itens_idpedido    ON itenspedidos (idpedido);

There are no results to be displayed.

---
**Query #19**

    CREATE INDEX idx_itens_idproduto   ON itenspedidos (idproduto);

There are no results to be displayed.

---
**Query #20**

    -- Índices aceleram SELECT, mas têm custo em INSERT/UPDATE.
    --   Crie apenas nos campos realmente consultados com frequência.
    
    
    -- --------------------------------------------------
    -- 6.3  EXPLAIN — enxergando como o banco "pensa"
    -- --------------------------------------------------
    -- Coloque EXPLAIN antes de qualquer SELECT para ver o plano de execução.
    
    EXPLAIN
    SELECT
        c.nome,
        SUM(ip.quantidade * ip.precounitario) AS total_gasto
    FROM pedidos            AS p
    INNER JOIN clientes     AS c   ON p.idcliente = c.id
    INNER JOIN itenspedidos AS ip  ON ip.idpedido = p.id
    GROUP BY c.nome
    HAVING total_gasto > 10.00;

| id  | select_type | table | partitions | type   | possible_keys                 | key     | key_len | ref                   | rows | filtered | Extra                           |
| --- | ----------- | ----- | ---------- | ------ | ----------------------------- | ------- | ------- | --------------------- | ---- | -------- | ------------------------------- |
| 1   | SIMPLE      | ip    |            | ALL    | PRIMARY,idx_itens_idpedido    |         |         |                       | 1    | 100      | Using temporary; Using filesort |
| 1   | SIMPLE      | p     |            | eq_ref | PRIMARY,idx_pedidos_idcliente | PRIMARY | 4       | Cafeteria.ip.idpedido | 1    | 100      | Using where                     |
| 1   | SIMPLE      | c     |            | eq_ref | PRIMARY                       | PRIMARY | 4       | Cafeteria.p.idcliente | 1    | 100      |                                 |

---

[View on DB Fiddle](https://www.db-fiddle.com/)