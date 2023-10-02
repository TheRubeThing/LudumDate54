high_scores = [0, 0, 0, 0, 0]

def update(score):
    for index in range(0, len(high_scores)):
        if score == high_scores[index]:
            break
        if score < high_scores[index]:
            continue
        high_scores.insert(index, score)
        high_scores.pop()
        break

def add_high_score(score):
    print(f"Current high_score {high_scores}")
    print(f"Adding score: {score}")
    update(score)
    print(f"Resulting high_score {high_scores}")

add_high_score(1)
add_high_score(1)
add_high_score(2)
add_high_score(5)
add_high_score(3)
add_high_score(10)
add_high_score(8)
add_high_score(8)
add_high_score(9)
