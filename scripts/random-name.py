#!/usr/bin/env zxpy
import random


if __name__ == "__main__":
    names = ["arjuna", "darwin", "carl-jung", "dylan"]
    try:
        sessions = ~"tmux ls"
        sessions = sessions.split("\n")[:-1]
        sessions = [sess.split(":")[0] for sess in sessions]
        candidates = set(names).difference(set(sessions))
    except:
        candidates = names
    print(random.choice(list(candidates)))
