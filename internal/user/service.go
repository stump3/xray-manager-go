package user

import (
	"errors"
	"fmt"

	"github.com/google/uuid"
)

type User struct {
	Email string
	ID    string
	Tag   string
}

func Add(email string, tag string) (*User, error) {
	if email == "" {
		return nil, errors.New("email is required")
	}

	if tag == "" {
		return nil, errors.New("tag is required")
	}

	id := uuid.New().String()

	user := &User{
		Email: email,
		ID:    id,
		Tag:   tag,
	}

	return user, nil
}
