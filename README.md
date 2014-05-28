ALSearchWorldGame
=================


# 題目：
有一個迷宮，其中有一個起點和一個終點，找出起點到終點的最短路徑。


# Point-to-Point Shortest Path


無負邊的話，最短路徑 Shortest Path一定是從最短的路徑開始挑。

演算法想法(greedy method)

Single Source Shortest Paths
Label Setting

1. 目前路徑都是最短的
2. 列出路徑：列出接下來所有的路徑
3. 選擇路徑：選擇最短的路徑
3. 加入路徑：加入該最短的路徑



# 可用的演算法：

## BFS, Dijkstra's algorithm


## Label Correcting Algorithm 
Shortest Path Faster Algorithm, SPFA
http://www.csie.ntnu.edu.tw/~u91029/Path2.html



### 想法
由起點開始，不斷朝鄰點拓展，不斷修正所有鄰點的最短路徑長度，其中必然涵蓋到最短路徑樹的點與邊。拓展過程當中，儘管無法確定最短路徑樹的長相，但是可以確定最短路徑樹正在一層一層生長。

一條最短路徑頂多 V-1 條邊，一棵最短路徑樹頂多 V 層。拓展鄰點 V-1 層之後，必能完成最短路徑樹。

### 演算法
令w[a][b]是a點到b點的距離（即是邊的權重）。
令d[a]是起點到a點的最短路徑長度，起點設為零，其他點都設為無限大。

一、把起點放入queue。
二、重複下面這件事，直到queue沒有東西為止：
　甲、從queue取出一點，作為a點。
　乙、找到一條邊ab：d[a] + w[a][b] < d[b]。
　丙、以邊ab來修正起點到b點的最短路徑：d[b] = d[a] + w[a][b]。
　丁、把b點放入queue。如果queue已有b點，則不放。

### 複雜度
圖的資料結構為 adjacency lists 的話，每一層最多有 V 個點、 E 條邊，最多拓展 V-1 層（遭遇負環則是 V 層），時間複雜度為 O((V+E)*V) = O(V^2 + VE) ，通常簡單寫成 O(VE) 。

圖的資料結構為 adjacency matrix 的話，便是 O(V^3) 。

### 練習題
UVa 10557 10682



## Bellman-Ford Algorithm 
Label Correcting Algorithm 的平行化版本。

# Point-to-Point Shortest Path: 
## A* Search
至於點到點最短路徑問題，可以套用估計函數 h(x) 。


# 我的演算法選擇

Label Correcting Algorithm, SPFA

迷宮的表示：
Adjacent List
坐標（點）：二維坐標
連接的點（邊）：坐標 array

- lazy initialization: 每走到一個點時，才判斷附近有哪些點可以走

Chooses:
PathQueue
choosePoints

Map:
twoDPoints
startPoint
endPoint

TwoDPoints:
Point:
(stepCountOfShortestPath)
isWalked:

Path:

選擇：
取得路徑：從一條從queue取得路徑（路徑上的所有點一定是所有路徑中距離最短的）
列出可選擇的點：從路徑中列出可以選擇的點 （所有的點一定會是最短的的路徑）
dequeue,enqueue:丟棄持有的路徑，依照


所有的路徑的所有可以到達的點

路徑記錄：
點的array
