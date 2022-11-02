# INSERT문 양식 제시
/*
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3, ...)
   VALUES (데이터값1, 데이터값2, 데이터값3, ...)
 */
# UPDATE 문 양식 제시
/*
UPDATE 테이블이름
SET 필드이름1=데이터값1, 필드이름2=데이터값2, ...
WHERE 필드이름=데이터값
 */
# DELETE 문 양식 제시
/*
 DELETE FROM 테이블이름
WHERE 필드이름=데이터값
 */

# [회원] (특정 {회원-식별자} 포함)
SELECT * FROM member
WHERE id = 'doggopawer';
# [글+회원+소메뉴] (특정 {소메뉴-이름} 포함) (생성일 기준 정렬) (내림차순) (5개)
SELECT * FROM writing w
JOIN member m ON w.member_id = m.id
JOIN small_menu sm on w.small_menu_id = sm.id
WHERE sm.name ='기술'
ORDER BY w.created_at
LIMIT 5;
# [글태그] ({이름} 기준 그룹화) ({이름} 개수)
SELECT name, COUNT(name) FROM writing_tag
GROUP BY name;
#[회원] ({활동점수} 기준 정렬) (내림차순)
SELECT * FROM member
ORDER BY activity_score DESC;
#[대메뉴+소메뉴] (특정 {대메뉴-이름} 포함)
SELECT * FROM small_menu sm
JOIN big_menu bm ON sm.big_menu_id = bm.id
WHERE bm.name = 'Q&A';
# [소메뉴+글] (특정 {소메뉴-이름} 포함) (생성일 기준 정렬) (내림차순) (특정 구간) (20개)
SELECT * FROM writing
JOIN small_menu ON writing.small_menu_id = small_menu.id
WHERE small_menu.name='기술'
ORDER BY writing.created_at DESC
LIMIT 20;
# [소메뉴+글] (특정 {소메뉴-이름} 포함) (조회수 기준 정렬) (내림차순) (특정 구간) (20개)
SELECT * FROM writing
JOIN small_menu ON writing.small_menu_id = small_menu.id
WHERE small_menu.name='기술'
ORDER BY writing.views DESC
LIMIT 20;
# [소메뉴+글+댓글] (특정 {소메뉴-이름} 포함) ({글-식별자} 기준 그룹화) ({글-식별자} 개수) (내림차순) (특정 구간) (20개)
SELECT w.id, COUNT(w.id) as comment_amount FROM small_menu sm
JOIN writing w ON sm.id = w.small_menu_id
JOIN big_comment bc ON w.id = bc.writing_id
WHERE sm.name='기술'
GROUP BY w.id
ORDER BY comment_amount DESC
LIMIT 20;
# [소메뉴+글+글추천] (특정 {소메뉴-이름} 포함) ({글-식별자} 기준 그룹화) ({글-식별자} 개수) (내림차순) (특정 구간) (20개)
SELECT w.id, COUNT(w.id) as wl_amount FROM small_menu sm
JOIN writing w ON sm.id = w.small_menu_id
JOIN writing_like wl ON w.id = wl.writing_id
WHERE sm.name='기술'
GROUP BY w.id
ORDER BY wl_amount DESC
LIMIT 20;
# [소메뉴+글+스크랩] (특정 {소메뉴-이름} 포함) ({글-식별자} 기준 그룹화) ({글-식별자} 개수) (내림차순) (특정 구간) (20개)
SELECT w.id, COUNT(w.id) as scrap_amount FROM small_menu sm
JOIN writing w ON sm.id = w.small_menu_id
JOIN scrap s ON w.id = s.writing_id
WHERE sm.name='기술'
GROUP BY w.id
ORDER BY scrap_amount DESC
LIMIT 20;
# [회원+글] (특정 {회원-식별자} 포함)
SELECT * FROM writing
JOIN member ON writing.member_id = member.id
WHERE member.id = 'doggopawer';
# [회원+댓글] (특정 {회원-식별자} 포함)
SELECT * FROM big_comment
JOIN member ON big_comment.member_id = member.id
WHERE member.id = 'doggopawer';
# [회원+대댓글] (특정 {회원-식별자} 포함)
SELECT * FROM small_comment
JOIN member ON small_comment.member_id = member.id
WHERE member.id = 'doggo';
# [회원+글추천] (특정 {회원-식별자} 포함)
SELECT * FROM writing_like
JOIN member ON writing_like.member_id = member.id
WHERE member.id = 'doggopawer';
# [회원+댓글추천] (특정 {회원-식별자} 포함)
SELECT * FROM big_comment_like
JOIN member ON big_comment_like.member_id = member.id
WHERE member.id = 'doggopawer';
# [회원+대댓글추천] (특정 {회원-식별자} 포함)
SELECT * FROM small_comment_like
JOIN member ON small_comment_like.member_id = member.id
WHERE member.id = 'doggopawer';
# [회원+글+스크랩] (특정 {회원-식별자} 포함)
SELECT * FROM  scrap
JOIN writing ON scrap.writing_id = writing.id
JOIN member ON scrap.member_id = member.id
WHERE member.id='doggopawer';
# [회원+글] (특정 {글-식별자} 포함)
SELECT * FROM writing
JOIN member ON writing.member_id = member.id
WHERE writing.id = 6;
# [글+댓글] (특정 {글-식별자} 포함)
SELECT * FROM big_comment
JOIN writing ON big_comment.writing_id = writing.id
WHERE writing.id = 2;
# [댓글+대댓글] (특정 {댓글-식별자} 포함)
SELECT * FROM small_comment
JOIN big_comment ON small_comment.big_comment_id = big_comment.id
WHERE big_comment.id = 1;
# [글+글추천] (특정 {글-식별자} 포함)
SELECT * FROM writing_like
JOIN writing ON writing_like.writing_id = writing.id
WHERE writing.id = 1;
# [댓글+댓글추천] (특정 {댓글-식별자} 포함)
SELECT * FROM big_comment_like
JOIN big_comment ON big_comment_like.big_comment_id = big_comment.id
WHERE big_comment.id = 1;
# [대댓글+대댓글추천] (특정 {대댓글-식별자} 포함)
SELECT * FROM small_comment_like
JOIN small_comment ON small_comment_like.small_comment_id = small_comment.id
WHERE small_comment.id = 2;
# [글+글태그] (특정 {글-식별자} 포함)
SELECT * FROM writing_tag
JOIN writing ON writing_tag.writing_id = writing.id
WHERE writing.id= 2;
# [태그+회원태그] (특정 {회원-식별자} 포함)
SELECT * FROM member_tag
JOIN member ON member_tag.member_id = member.id
WHERE member.id= 'doggopawer';


