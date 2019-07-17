let M = 3
let N = 3
var input = [[2,3,4],
             [2,6,8],
             [3,4,6]]
var shortestPaths = [[Int]](repeatElement([Int](repeatElement(Int.max, count: N)), count: M))

func search(_ currentPosition: (Int, Int),
                 _ path: [(Int, Int)],
                 _ totalCost: Int,
                 _ shortestPath: [(Int, Int)],
                 _ lowestCost: Int)
    -> ([(Int, Int)], Int) {
        if (totalCost >= lowestCost) {
            return (shortestPath, lowestCost)
        }
        let (i, j) = currentPosition
        var lowestCost = lowestCost
        var shortestPath = shortestPath
        if (currentPosition == (M - 1, N - 1)) {
            return (path, totalCost)
        }
        if (shortestPaths[i][j] < totalCost) {
            return (shortestPath, lowestCost)
        }
        shortestPaths[i][j] = totalCost
        if (i > 0) {
            if (j > 0) {
                let result = search((i - 1, j - 1), path + [(i - 1, j - 1)], totalCost + input[i - 1][j - 1], shortestPath, lowestCost)
                if (result.1 < lowestCost) {
                    lowestCost = result.1
                    shortestPath = result.0
                }
            }
            if (j < N - 1) {
                let result = search((i - 1, j + 1), path + [(i - 1, j + 1)], totalCost + input[i - 1][j + 1], shortestPath, lowestCost)
                if (result.1 < lowestCost) {
                    lowestCost = result.1
                    shortestPath = result.0
                }
            }
            let result = search((i - 1, j), path + [(i - 1, j)], totalCost + input[i - 1][j], shortestPath, lowestCost)
            if (result.1 < lowestCost) {
                lowestCost = result.1
                shortestPath = result.0
            }
        }
        if (i < M - 1) {
            if (j > 0) {
                let result = search((i + 1, j - 1), path + [(i + 1, j - 1)], totalCost + input[i + 1][j - 1], shortestPath, lowestCost)
                if (result.1 < lowestCost) {
                    lowestCost = result.1
                    shortestPath = result.0
                }
            }
            if (j < N - 1) {
                let result = search((i + 1, j + 1), path + [(i + 1, j + 1)], totalCost + input[i + 1][j + 1], shortestPath, lowestCost)
                if (result.1 < lowestCost) {
                    lowestCost = result.1
                    shortestPath = result.0
                }
            }
            let result = search((i + 1, j), path + [(i + 1, j)], totalCost + input[i + 1][j], shortestPath, lowestCost)
            if (result.1 < lowestCost) {
                lowestCost = result.1
                shortestPath = result.0
            }
        }
        if (j > 0) {
            let result = search((i, j - 1), path + [(i, j - 1)], totalCost + input[i][j - 1], shortestPath, lowestCost)
            if (result.1 < lowestCost) {
                lowestCost = result.1
                shortestPath = result.0
            }
        }
        if (j < N - 1) {
            let result = search((i, j + 1), path + [(i, j + 1)], totalCost + input[i][j + 1], shortestPath, lowestCost)
            if (result.1 < lowestCost) {
                lowestCost = result.1
                shortestPath = result.0
            }
        }
        return (shortestPath, lowestCost)
}

let shortPath = search((0, 0), [(0, 0)], input[0][0], [], Int.max)
print(shortPath)

//output:
//([(0, 0), (1, 1), (2, 2)], 14)
