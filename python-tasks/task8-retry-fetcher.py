import logging
import time


logging.basicConfig(level=logging.INFO, format="%(message)s")


class Timer:
    def __enter__(self):
        self.start = time.time()
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        end = time.time()
        elapsed = end - self.start
        logging.info(f"Total time: {elapsed:.2f} seconds")


def fetch_with_retry(fetch_fn, retries=3, delay=1.0):
    last_error = None

    with Timer():
        for attempt in range(1, retries + 1):
            try:
                logging.info(f"Attempt {attempt}")
                return fetch_fn()

            except Exception as error:
                logging.info(f"Attempt {attempt} failed")
                last_error = error

                if attempt < retries:
                    time.sleep(delay)

    raise last_error


attempts = 0


def fake_fetch():
    global attempts
    attempts += 1

    if attempts <= 2:
        raise Exception("Temporary problem")

    return "Fetch worked!"


if __name__ == "__main__":
    result = fetch_with_retry(fake_fetch, retries=3, delay=1)
    logging.info(result)
