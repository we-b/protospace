Structure of DataBase

## User
### association

```
has_many :prototypes, likes, comments
```

### table
- name
- email
- password
- avatar
- profile
- position
- occupation

## Prototype
### association

```
has_many :captured_images, comments, likes
belongs_to :user
```

### table
- title
- catch_copy
- concept
- user_id

## CapturedImage
### association

```
belongs_to :prototype
```

### table
- content
- status
- prototype_id


## Like
### association

```
belongs_to :user, :prototype
```

### table
- user_id
- prototype_id



## Comment
### association

```
belongs_to :user, :prototype
```

### table
- content
- user_id
- prototype_id

