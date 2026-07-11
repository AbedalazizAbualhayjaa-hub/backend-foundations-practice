import sqlite3


DB_NAME = "practice.db"


def create_table():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS notes (
            id INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            body TEXT NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)

    conn.commit()
    conn.close()


def add_note(title, body):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    with conn:
        cursor.execute(
            "INSERT INTO notes (title, body) VALUES (?, ?)",
            (title, body)
        )

    conn.close()


def list_notes():
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM notes")
    notes = cursor.fetchall()

    conn.close()
    return notes


def get_note(note_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    cursor.execute(
        "SELECT * FROM notes WHERE id = ?",
        (note_id,)
    )

    note = cursor.fetchone()

    conn.close()
    return note


def update_note(note_id, title, body):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    with conn:
        cursor.execute(
            "UPDATE notes SET title = ?, body = ? WHERE id = ?",
            (title, body, note_id)
        )

    conn.close()


def delete_note(note_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    cursor.execute(
        "DELETE FROM notes WHERE id = ?",
        (note_id,)
    )

    conn.commit()
    conn.close()


if __name__ == "__main__":
    create_table()

    add_note("First note", "This is my first note.")
    add_note("Second note", "This is another note.")

    print("All notes:")
    print(list_notes())

    print("Note with id 1:")
    print(get_note(1))

    update_note(1, "Updated note", "The first note was updated.")

    print("After update:")
    print(get_note(1))

    delete_note(2)

    print("After delete:")
    print(list_notes())
