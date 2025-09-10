package main

import "testing"

func TestTodo(t *testing.T) {
	t.Run("no files exist, default to project directory", func(t *testing.T) {
		got := ResolveToHome("fake.md", "tmp-dir")
		want := "tmp-dir/fake.md"
		if got != want {
			t.Errorf("got %q want %q", got, want)
		}
	})

	t.Run("local file exists", func(t *testing.T) {
		got := ResolveToHome("fake", "tmp-dir")
		want := "tmp-dir/fake"
		if got != want {
			t.Errorf("got %q want %q", got, want)
		}
	})
}
