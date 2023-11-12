USE db_109403021;

SELECT * FROM `Category`;
SELECT * FROM `Comment`;
SELECT * FROM `FAQ`;
SELECT * FROM `FollowingRecord`;
SELECT * FROM `Member`;
SELECT * FROM `MemberCredential`;
SELECT * FROM `Proposal`;
SELECT * FROM `ProposalMember`;
SELECT * FROM `ProposalOption`;
SELECT * FROM `SponsorRecord`;

INSERT INTO `Proposal` VALUES(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0
,100000,1,0,'2022/3/22',null,0);

DELETE FROM Member
WHERE member_id = 11;

UPDATE `Comment`
SET proposer_response = null
WHERE id = 3;

SELECT NOW(),DATE_ADD(NOW(),INTERVAL 90 DAY);

SELECT *
FROM Proposal JOIN ProposalOption JOIN SponsorRecord
ON Proposal.id = proposal_id AND proposal_option_id = ProposalOption.id;



SELECT proposal_id
FROM SponsorRecord
WHERE  member_id != 9;

SELECT proposal_id 
FROM ProposalMember 
WHERE  member_id != 10
order by id;

SELECT proposal_id
FROM SponsorRecord
WHERE member_id IN(SELECT member_id
					FROM SponsorRecord
					WHERE proposal_id IN(SELECT proposal_id
											FROM SponsorRecord
											WHERE member_id = 1)AND member_id != 1);
