CREATE TABLE Users(
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Boards(
    board_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL
);
CREATE TABLE Posts(
    post_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    board_id BIGINT,
    FOREIGN KEY (board_id) REFERENCES Boards(board_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Comments(
    comment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    post_id BIGINT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE TAGS(
    tag_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE Post_Tags(
    post_id BIGINT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    tag_id BIGINT NOT NULL,
    FOREIGN KEY (tag_id) REFERENCES TAGS(tag_id)
);