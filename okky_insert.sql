INSERT INTO member
        (id, password, email, name, nick, marketing_yn, activity_score, admin_yn, profile_url)
VALUES (
        'doggo',
        '1234',
        'doggo@gmail.com',
        '김동현',
        'doggo',
        true,
        0,
        true,
        'http://www.naver.com'
       );

INSERT INTO big_menu
        (name, member_id)
VALUES (
        '지식',
        'doggopawer'
       );

INSERT INTO small_menu
        (name, member_id, big_menu_id)
VALUES (
        '기술',
        'doggopawer',
        (SELECT id from big_menu WHERE name='Q&A')
       );

INSERT INTO writing
        (title, description, views, updated_yn, member_id, small_menu_id)
VALUES (
        '첫번째 글',
        '첫번째 내용',
        0,
        0,
        'doggopawer',
        '1'
       );

INSERT INTO big_comment
        (description, adopt_yn, updated_yn, member_id, writing_id)
VALUES (
        '첫번째 댓글',
        0,
        0,
        'doggopawer',
        '1'
       );

INSERT INTO small_comment
        (description, updated_yn, member_id, big_comment_id)
VALUES (
        '첫번째 대댓글',
        false,
        'doggopawer',
        1
       );

INSERT INTO writing_like
        (like_type, member_id, writing_id)
VALUES (
        'up',
        'doggopawer',
        1
       );

INSERT INTO big_comment_like
        (like_type, member_id, big_comment_id)
VALUES (
        'up',
        'doggopawer',
        1
       );

INSERT INTO small_comment_like
        (like_type, member_id, small_comment_id)
VALUES (
        'up',
        'doggopawer',
        2
       );

INSERT INTO member_tag
        (name, member_id)
VALUES (
        'java',
        'doggopawer'
       );

INSERT INTO writing_tag
        (name, writing_id)
VALUES (
        'java',
        1
       );

INSERT INTO scrap
        (member_id, writing_id)
VALUES (
        'doggopawer',
        1
       );
