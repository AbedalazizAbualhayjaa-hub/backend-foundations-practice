import string


class FileMissingError(Exception):
    pass


def word_frequencies(path: str) -> dict[str, int]:
    """Return how many times each word appears in a text file."""
    try:
        with open(path, "r") as file:
            text = file.read()
    except FileNotFoundError:
        raise FileMissingError("The file does not exist.")

    text = text.lower()

    for symbol in string.punctuation:
        text = text.replace(symbol, "")

    words = text.split()
    counts = {}

    for word in words:
        counts[word] = counts.get(word, 0) + 1

    return counts


if __name__ == "__main__":
    try:
        result = word_frequencies("python-tasks/sample.txt")

        top_words = sorted(result.items(), key=lambda item: item[1], reverse=True)

        print("Top 5 words:")
        for word, count in top_words[:5]:
            print(word, count)

    except FileMissingError as error:
        print(error)
