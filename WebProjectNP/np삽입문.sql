------------------------------------------------ 데이터 삽입
-- 스토어 카테고리
insert into tblStore values (1, '영양제');
insert into tblStore values (2, '식품');
insert into tblStore values (3, '용품');


--DML tblLv(회원등급)
insert into tblLv (lvSeq, lv) values(1, '베이직');
insert into tblLv (lvSeq, lv) values(2, '실버');
insert into tblLv (lvSeq, lv) values(3, '골드');
insert into tblLv (lvSeq, lv) values(4, 'VIP');


-- 관리자
insert into tblAdmin(adminSeq, adminId, adminPw) values (adminSeq.nextVal,'admin1','admin1');
insert into tblAdmin(adminSeq, adminId, adminPw) values (adminSeq.nextVal,'admin2','admin3');
insert into tblAdmin(adminSeq, adminId, adminPw) values (adminSeq.nextVal,'admin2','admin3');

--공지사항
insert into tblNotice(noticeSeq, adminSeq, noticeSubject,noticeContent,noticeRegdate,noticeImg) values (noticeSeq.nextVal,1,'정기구독과 바로 구매의 차이','정기구독이란?
매월(30일 기준) 영양제가 소진되기 전에 정기적으로 배송되는 서비스에요.
필리는 고객님들의 건강을 지켜드리기 위해 꾸준히 영양성분을 섭취하는 것이 매우 중요하다고 생각하고 있어요.
그래서 구입한 영양제들을 잘 섭취할 수 있도록 돕는 필리 케어와
따로 신경 쓰지 않아도 정기적으로 배송이 되는 배송 서비스를 제공해 드려요.

정기구독 혜택이 있나요?
첫째, 정기구독을 해지하시기 전까지 배송비가 무료^^입니다.(평생 이용하시면 평생 무료!)
둘째, 장기유지고객 할인으로 1%부터 시작해서 최대 10%까지 받으실 수 있어요.
셋째, 친구분이 추천 코드로 정기구독 시작하시면 친구와 고객분 모두 할인받으실 수 있어요.
(친구 1명 당 5%씩 최대 5명 25%까지)
넷째, 필리 케어 서비스를 통해 섭취 관리해 드려요!
(카카오톡 알림 서비스를 통해 섭취 알림 및 체크하실 수 있어요)
다섯째, 언제든지 정기구독 해지 가능해요!(정기구독 부담스럽지 않아요)

한 번만 구매하기란?
일회성으로 필리 제품을 낱개로 구매하실 수 있어요.(다만, 배송비가 추가돼요)', sysdate, null);

insert into tblNotice(noticeSeq, adminSeq, noticeSubject,noticeContent,noticeRegdate,noticeImg) values (noticeSeq.nextVal,2,'멀티비타민 보다 좋은점','생활 패턴 및 라이프 스타일을 기반으로 영양성분을 추천해 드리고 있어요.

멀티비타민은 다양한 영양성분이 포함되어 있지만 본인에게 섭취할 필요가 없는 성분이 과 섭취되거나,
한 알에 모든 영양성분이 담겨 있기 때문에 필요한 성분을 충분히 섭취할 수 없는 경우가 있어요.

이런 부분을 개선하기 위해 필리는 제품 간 중복 성분이 없고, 권장량을 충분히 넣은 단일 제품을 만들었어요.
그리고 권장 섭취량과 상한 섭취량을 고려하여 알맞은 영양성분을 제공하고 있어요.', sysdate, null);

insert into tblNotice(noticeSeq, adminSeq, noticeSubject,noticeContent,noticeRegdate,noticeImg) values (noticeSeq.nextVal,3,'2022년 12월 뉴핏 서비스 개편 안내','안녕하세요.
여러분의 건강메이트 뉴핏입니다.

뉴핏이 영양제 외에 더 다양한 건강 고민 솔루션을 드리는 셀프 메디케이션 플랫폼으로 서비스를 확장했습니다.

모두가 건강한 삶을 유지하도록 돕는다 라는 필리의 미션을 더 잘 달성하기 위해 새로워진 뉴핏을 소개 드려요!

1. 건강 관리 아이템을 한 번에

뉴핏은 영양제만 파는 곳? NO! 

이젠 뉴핏에서 건강용품, 건강식품, 기능성 화장품, 생활용품 등 일상 속 건강 관리를 위한 제품을 한 번에 찾고 구매할 수 있어요.

아래 세 가지 방법으로 더 풍성하고 편리해진 뉴핏을 이용해 보세요.', sysdate, null);

insert into tblNotice(noticeSeq, adminSeq, noticeSubject,noticeContent,noticeRegdate,noticeImg) values (noticeSeq.nextVal,1,'뉴핏 중요 공지','안녕하세요. 

맞춤영양제 뉴핏입니다. 



5월 27일 오후 물류창고에 화재가 발생하여 창고에 보관되어 있던 제품을 전량 폐기 후 새로 생산된 제품으로 제공하려고 합니다. 

예상치 못한 물류창고 화재로 인하여 주문 및 배송에 불편을 드려 죄송합니다. 



배송 가능 일정은 추후 안내드릴 예정입니다. 

배송 일정을 확정 후에는 정기구독을 이용하시는 고객님께 감사의 마음으로 다음 정기구독 결제 시 35% 추가 할인을 제공해 드리겠습니다. 

첫 정기구독을 이용하시는 고객님께도 동일한 할인 혜택을 적용해 드리겠습니다. 



뉴핏 임직원은 우수한 품질의 제품을 빠르게 제공해 드릴 수 있도록 최선을 다하겠습니다. 



감사합니다. 

뉴핏 드림 ', sysdate, null);

--꿀팁
insert into tblTip(tipSeq, adminSeq, tipSubject,tipContent,tipRegdate,tipImg) values (tipSeq.nextVal,1,'단기간 늘어난 뱃살 빠르게 빼는 운동','코로나19로 오랜 시간 집안에 머무르는 시간이 늘어나며 상대적으로 몸의 움직임은 줄었습니다.  

그러다 보니 뱃살은 살찐 것을 제일 쉽게 알 수 있습니다.

뱃살은 미용상으로도 안 좋아 보일 수 있지만 심장질환, 당뇨 등 복합질환으로 번질 수 있기에 미리 대비하는 목적으로 관리가 필요한 부위입니다. 
오늘은 아주 간편하게 방 안에서 맨몸으로도 할 수 있는 뱃살 빼기 동작에 대해 알려드리도록 하겠습니다.', sysdate, null);

insert into tblTip(tipSeq, adminSeq, tipSubject,tipContent,tipRegdate,tipImg) values (tipSeq.nextVal,3,'손가락 가늘어지는 10분 루틴','집안일, 사무직(마우스, 키보드 사용) 손가락을 많이 사용하면 손마디가 붓고 손가락이 휘는 등 염증이 생길 수 있습니다. 그러나 손가락 운동을 꾸준히 하면 손가락 관절염 예방은 물론 관절의 유연성까지 챙길 수 있다고 하는데요. 

전신 건강을 위해 유산소, 근력 운동은 열심히 하지만 소홀히 돌보지 않는 손가락.

오늘은 작고 소중한 여러분의 손가락을 위한 힐링 운동 처방 동작을 알려 드리겠습니다. ', sysdate, null);

insert into tblTip(tipSeq, adminSeq, tipSubject,tipContent,tipRegdate,tipImg) values (tipSeq.nextVal,2,'다리 부종 푸는 스트레칭','최근 홈트 필수품으로 매트와 폼롤러는 필수품이 되었습니다. 또 스트레칭을 하는 방법도 어렵지 않은데요. 
늘씬한 하체라인, 매끄러운 다리라인은 물론 붓기 제거에도 탁월한 효과를 보입니다. 
경직된 근육은 만성이 되면 수축이 되기 때문에 하루 10분이라도 시간을 내어 스트레칭을 하는 습관을 기르는 것이 좋은데요.

그렇다면 어떤 스트레칭이 좋을까요? 

지난번 폼롤러를 이용해 상체를 풀어주는 방법을 알려드렸는데요. 상체 푸는 방법은 아래 링크를 통해 확인해 보시길 바라며, 오늘은 폼롤러 하체 편을 준비했습니다.
하체의 전반적인 부분(엉덩이 위쪽, 골반 사이, 골반 바로 위쪽에 붙어 있는 근육) 등 을  풀어보겠습니다.', sysdate, null);

-- 영양제 성분
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'오메가3','3000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'프로바이오틱스(유산균)','10000000000CFU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민C','2000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민A','3000IU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B1','1.1mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'칼슘','700mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민D','800IU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B6','1.4mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'엽산','1mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민K','70mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민E','400IU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B12','1000mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'아연','10mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'마그네슘','350mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'칼륨','3500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B2','1.5mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'철','14mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B3','1500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비타민B5','5mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비오틴','30mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'베타카로틴','6000IU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'판토텐산','50mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'가르니시아캄보지아','1000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'레시틴','3600mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'코엔자임Q10','100mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'루테인','20mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'바나나잎추출물','50g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'글루코사민','1500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'옥타코사놀','40mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'쏘팔메토','115mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'셀레늄','60mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'폴리코사놀','40mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'공액리놀레산','4000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'스페인감초추출물(글라브리딘)','150mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'크롬','250mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'녹차추출물','1000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'잔티젠','600mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'시서스추출물','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'홍삼','6g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'실리마린','130g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'베타카로틴','6000IU');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'감마리놀렌산','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'히알루론산','120mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'홍국','8mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'프로폴리스','17mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'지아잔틴','20mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'감태','100mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'아스타잔틴','12mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'빌베리추출물','240mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'허니부쉬추출물','240mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'인삼','6g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'MSM','2000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'유단백가수분해물','150mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'은행잎추출물','120mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'커큐민','1500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'시네트롤','900mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'로즈마리자몽추출복합물','250mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'보스웰리아','5g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'엉겅퀴복합추출물','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'대두소이플라본','27mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'알로에전잎','30mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'비오틴','10000mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'감마오리자놀','800mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'그린커피빈추출물','500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'키토산','4.5g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'N-아세틸글루코사민','1000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'크레아틴','5g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'곰피','100g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'프락토올리고당','15g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'요오드','2.4mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'망간','4mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'크랜베리','40g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'피크노제놀','75mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'아르가닌','4000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'UDCA','150mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'테아닌','200mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'락토페린','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'몰리브덴','500mcg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'구리','0.8mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'포스파티딜콜린','900mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'스피루리나','10g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'밀크씨슬','130mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'차전자피','3g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'회화나무열매추출물','350mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'매스틱검','1000mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'글루타치온','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'알파리포산','1800mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'클레우스포스콜리','500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'L-카르니틴','2g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'콜라겐','2.5g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'초록입홍합추출분말','620mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'포스파티딜세린','300mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'맥주효모','3g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'이눌린','12g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'홍경천추출물','200mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'콘드로이친','1200mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'마카','1500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'크릴오일','500mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'뮤코다당.단백','1.5g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'알로에겔','30mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'클로렐라','3g');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'헤모힘','40mg');
insert into tblIngredient(ingredientSeq, ingredientName, ingredientIntake) values (ingredientSeq.nextVal,'세라마이드','1000mg');



-- 상세 카테고리
insert into tblCategory values (categorySeq.nextVal, '여성건강', 1);
insert into tblCategory values (categorySeq.nextVal, '관절/뼈', 1);
insert into tblCategory values (categorySeq.nextVal, '구강관리', 1);
insert into tblCategory values (categorySeq.nextVal, '다이어트', 1);
insert into tblCategory values (categorySeq.nextVal, '마음건강', 1);
insert into tblCategory values (categorySeq.nextVal, '피부', 1);
insert into tblCategory values (categorySeq.nextVal, '노화', 1);
insert into tblCategory values (categorySeq.nextVal, '피로', 1);
insert into tblCategory values (categorySeq.nextVal, '간 건강', 1);
insert into tblCategory values (categorySeq.nextVal, '장 건강', 1);
insert into tblCategory values (categorySeq.nextVal, '남성 건강', 1);
insert into tblCategory values (categorySeq.nextVal, '위/소화', 1);
insert into tblCategory values (categorySeq.nextVal, '변비', 1);
insert into tblCategory values (categorySeq.nextVal, '눈건강', 1);
insert into tblCategory values (categorySeq.nextVal, '면역력', 1);
insert into tblCategory values (categorySeq.nextVal, '임신', 1);
insert into tblCategory values (categorySeq.nextVal, '모발/두피', 1);
insert into tblCategory values (categorySeq.nextVal, '유아/소아', 1);
insert into tblCategory values (categorySeq.nextVal, '효소', 2);
insert into tblCategory values (categorySeq.nextVal, '젤리', 2);
insert into tblCategory values (categorySeq.nextVal, '음료', 2);
insert into tblCategory values (categorySeq.nextVal, '오일', 2);
insert into tblCategory values (categorySeq.nextVal, '쉐이크', 2);
insert into tblCategory values (categorySeq.nextVal, '구강케어', 3);
insert into tblCategory values (categorySeq.nextVal, '바디케어', 3);
insert into tblCategory values (categorySeq.nextVal, '헤어케어', 3);
insert into tblCategory values (categorySeq.nextVal, '여성용품', 3);
insert into tblCategory values (categorySeq.nextVal, '남성용품', 3);
insert into tblCategory values (categorySeq.nextVal, '마스크팩', 3);
insert into tblCategory values (categorySeq.nextVal, '손소독제', 3);

-- 배송현황
insert into tblDeliver values (memberDeliverySeq.nextVal, '입금확인');
insert into tblDeliver values (memberDeliverySeq.nextVal, '상품준비중');
insert into tblDeliver values (memberDeliverySeq.nextVal, '배송중');
insert into tblDeliver values (memberDeliverySeq.nextVal, '배송완료');







-- QnA카테고리
insert into tblQnaCategory (qnaCategorySeq, qnaCategoryName) values(1, '건강');
insert into tblQnaCategory (qnaCategorySeq, qnaCategoryName) values(2, '다이어트');
insert into tblQnaCategory (qnaCategorySeq, qnaCategoryName) values(3, '모발');
insert into tblQnaCategory (qnaCategorySeq, qnaCategoryName) values(4, '피부');


-- 상품
--행 1
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비타민B',300,12000,'product_1.png','detail_1.jpg',1);
--행 2
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프로바이오틱스',480,13800,'product_2.png','detail_2.jpg',1);
--행 3
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'오메가3',300,13500,'product_3.png','detail_3.jpg',1);
--행 4
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'칼슘 마그네슘 비타민',750,12400,'product_4.png','detail_4.jpg',1);
--행 5
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비타민C',800,12000,'product_5.png','detail_5.jpg',1);
--행 6
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'코엔자임Q10',408,15700,'product_6.png','detail_6.jpg',1);
--행 7
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'홍삼 옥타코사놀',350,21000,'product_7.png','detail_7.jpg',1);
--행 8
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'밀크씨슬',400,11300,'product_8.png','detail_8.jpg',1);
--행 9
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'히알루론산 스피루리나',500,19500,'product_9.png','detail_9.jpg',1);
--행 10
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'루테인',600,10600,'product_10.png','detail_10.jpg',1);
--행 11
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'콜라겐',500,26800,'product_11.png','detail_11.jpg',1);
--행 12
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'리턴업 쾌변케어 차전자피',700,50000,'product_12.png','detail_12.jpg',1);
--행 13
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'전립소 쏘팔메토 골드',200,39000,'product_13.png','detail_13.jpg',1);
--행 14
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프로폴리스 젤리',1000,12500,'product_14.png','detail_14.jpg',2);
--행 15
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'우먼즈 펨 도필러스 30캡슐',1600,30900,'product_15.png','detail_15.jpg',1);
--행 16
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'도필러스 이피에스 60캡슐',700,33900,'product_16.png','detail_16.jpg',1);
--행 17
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'판토테산 100캡슐',900,22900,'product_17.png','detail_17.jpg',1);
--행 18
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'엠에스엠 1000mg',400,54900,'product_18.png','detail_18.jpg',1);
--행 19
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'액상 칼슘 마그네슘',800,25900,'product_19.png','detail_19.jpg',1);
--행 20
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'알러케어',140,22900,'product_20.png','detail_20.jpg',1);
--행 21
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'액상 비타민 D3',100,12900,'product_21.png','detail_21.jpg',1);
--행 22
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'퓨어 DHA',120,15900,'product_22.png','detail_22.jpg',1);
--행 23
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'액상 비타민 C',100,11900,'product_23.png','detail_23.jpg',1);
--행 24
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'코드리버오일 대구간유',80,30000,'product_24.png','detail_24.jpg',1);
--행 25
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'보라지유 감마리놀렌산 60캡슐',250,27900,'product_25.png','detail_25.jpg',1);
--행 26
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비오틴 10,000 에프디 60정',300,17000,'product_26.png','detail_26.jpg',1);
--행 27
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'스업윔',140,45000,'product_27.png','detail_27.jpg',1);
--행 28
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'스텝1 에이밸런스 유산균',60,38900,'product_28.png','detail_28.jpg',1);
--행 29
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'스텝2 스마트 키즈큐',230,49000,'product_29.png','detail_29.jpg',1);
--행 30
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'더알티지 오메가3',500,30000,'product_30.png','detail_30.jpg',1);
--행 31
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'더징크디 3000IU',450,35000,'product_31.png','detail_31.jpg',1);
--행 32
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'더폴릭포 대디',230,30000,'product_32.png','detail_32.jpg',1);
--행 33
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'더폴릭포 마미',200,30000,'product_33.png','detail_33.jpg',1);
--행 34
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'더헴철포 우먼',600,30000,'product_34.png','detail_34.jpg',1);
--행 35
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'발효효소 베이직',200,30000,'product_35.png','detail_35.jpg',2);
--행 36
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'플라이밀 초코',400,5000,'product_36.png','detail_36.jpg',2);
--행 37
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'플라이밀 그린',700,5000,'product_37.png','detail_37.jpg',2);
--행 38
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'플라이밀 브라운',600,5000,'product_38.png','detail_38.jpg',2);
--행 39
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'플라이밀 블랙',300,5000,'product_39.png','detail_39.jpg',2);
--행 40
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'엠씨티(MCT) 오일 591ml',230,31900,'product_40.png','detail_40.jpg',2);
--행 41
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'에어 콘스프',600,2500,'product_41.png','detail_41.jpg',2);
--행 42
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프로틴스낵 바나나',130,3500,'product_42.png','detail_42.jpg',2);
--행 43
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프로틴스낵 칠리',200,3500,'product_43.png','detail_43.jpg',2);
--행 44
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프로틴스낵 메이플',800,3000,'product_44.png','detail_44.jpg',2);
--행 45
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'디데이밀 밸런스',200,3500,'product_45.png','detail_45.jpg',2);
--행 46
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'브이차 에센셜',89,34000,'product_46.png','detail_46.jpg',2);
--행 47
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'애플사이다 비니거 구미(60개)',52,28900,'product_47.png','detail_47.jpg',2);
--행 48
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'알디콤 5포',233,17000,'product_48.png','detail_48.jpg',2);
--행 49
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'마카롱EX 15포',170,31000,'product_49.png','detail_49.jpg',2);
--행 50
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'아르타민',500,41000,'product_50.png','detail_50.jpg',2);
--행 51
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'취선',600,6000,'product_51.png','detail_51.jpg',2);
--행 52
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'습기철벽 텅텅통',240,4000,'product_52.png','detail_52.jpg',3);
--행 53
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'마이솝 핸드겔',200,3500,'product_53.png','detail_53.jpg',3);
--행 54
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'내츄럴 비타민 21.5% 인핸싱 시트 마스크',450,2500,'product_54.png','detail_54.jpg',3);
--행 55
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 손목보호대L(왼손)',100,40900,'product_55.png','detail_55.jpg',3);
--행 56
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'바르다 목선생 목교정기',200,55000,'product_56.png','detail_56.jpg',3);
--행 57
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 손목보호대R(오른손)',150,40900,'product_57.png','detail_57.jpg',3);
--행 58
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 무릎보호대M(블랙)',600,35000,'product_58.png','detail_58.jpg',3);
--행 59
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 무릎보호대L(블랙)',420,35000,'product_59.png','detail_59.jpg',3);
--행 60
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 종아리 압박밴드M',380,35000,'product_60.png','detail_60.jpg',3);
--행 61
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'캐리밴드 종아리 압박밴드S',500,35000,'product_61.png','detail_61.jpg',3);
--행 62
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'닥터노아 치실(실크)',80,5800,'product_62.png','detail_62.jpg',3);
--행 63
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'오비츠 자일리톨 고체치약 프레쉬민트향',34,5300,'product_63.png','detail_63.jpg',3);
--행 64
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'마루 대나무 칫솔 스탠다드(1개입)',60,2800,'product_64.png','detail_64.jpg',3);
--행 65
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'마루 대나무 칫솔 스탠다드(6개입)',100,16800,'product_65.png','detail_65.jpg',3);
--행 66
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'오비츠 자일리톨 고체치약 유자민트향',140,5300,'product_66.png','detail_66.jpg',3);
--행 67
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비오틴 탈모케어 샴푸 500ml',98,25000,'product_67.png','detail_67.jpg',3);
--행 68
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비오틴 탈모케어 앰플 100ml',140,18000,'product_68.png','detail_68.jpg',3);
--행 69
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'비오틴 워터 트리트먼트 250ml',400,20000,'product_69.png','detail_69.jpg',3);
--행 70
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프레시브레스 오랄린스 마일드민트 473ml',206,15000,'product_70.png','detail_70.jpg',3);
--행 71
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'프레시브레스 오랄린스 아이시민트 473ml',680,15000,'product_71.png','detail_71.jpg',3);
--행 72
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'달에서 온 팩 5매입',400,10000,'product_72.png','detail_72.jpg',3);
--행 73
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'홀리스모크 팔로산토 내추럴 인센스스틱(10g)',140,12000,'product_73.png','detail_73.jpg',3);
--행 74
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'홀리스모크 인센스 홀더',265,33000,'product_74.png','detail_74.jpg',3);
--행 75
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'홀리스모크 팔로산토(THIN)',160,14000,'product_75.png','detail_75.jpg',3);
--행 76
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'올림피아 자그놀리 x 글로썸 인센스 콜라보 에디션',240,33000,'product_76.png','detail_76.jpg',3);
--행 77
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'홀리스모크 팔로산토 버너',400,65000,'product_77.png','detail_77.jpg',3);
--행 78
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'콤부차 페미닌 폼워시(개운한 타입)',189,18000,'product_78.png','detail_78.jpg',3);
--행 79
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'렛츠 인클리어 질세정기',200,9900,'product_79.png','detail_79.jpg',3);
--행 80
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'데일리 여성청결티슈',150,13000,'product_80.png','detail_80.jpg',3);
--행 81
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'인클리어 질세정기',440,12000,'product_81.png','detail_81.jpg',3);
--행 82
INSERT INTO TBLPRODUCT (PRODUCTSEQ, PRODUCTNAME, PRODUCTINVENTORY, PRODUCTPRICE, PRODUCTIMAGE, PRODUCTDETAILIMAGE, CATEGORYSEQ) VALUES (productSeq.nextVal,'스윔카운트',200,79000,'product_82.png','detail_82.jpg',3);




-- 회원-등급
insert into tblMemberLv (memberLvSeq, lvSeq) values (1,1);
insert into tblMemberLv (memberLvSeq, lvSeq) values (2,2);
insert into tblMemberLv (memberLvSeq, lvSeq) values (3,3);
insert into tblMemberLv (memberLvSeq, lvSeq) values (4,4);


-- 회원 정보
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장별태', 'tunfr2644', 'kgicm1433', 'dsdr9089@naver.com', '752662-6209187', 'f', '대전광역시 북부대로 한신아파트 934호', '010-4860-9499', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정현보', 'tyicm9646', 'kjgt9855', 'zmpb8995@gmail.com', '725136-3773056', 'f', '강원도 죽양대로 수락아파트 687호', '010-8315-1445', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장태혜', 'zmnm6798', 'toaq2474', 'gsyz982@naver.com', '999246-4565746', 'm', '부산광역시 노해로 르티울 456호', '010-7031-8629', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '한주유', 'tibw8467', 'ccya1399', 'gsdr272@naver.com', '758746-5795734', 'm', '부산광역시 하온대로 아이파크 474호', '010-9619-1887', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강보동', 'zbnz8316', 'ccna9177', 'gdicm4576@gmail.com', '700131-1876244', 'm', '경기도 노해로 감동빌라 25호', '010-8423-2738', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '양별은', 'kgyb2426', 'q2dr7598', 'klgt9978@naver.com', '929576-7217567', 'f', '부산광역시 성남대로 감동빌라 869호', '010-5193-9646', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노진빈', 'zxeb7120', 'zbpb4701', 'tuna9889@daum.net', '918379-5505340', 'm', '세종시 한글비석로 한신아파트 651호', '010-9353-2077', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '양영영', 'kjyq8929', 'ccpb8141', 'bgyb7884@daum.net', '649749-2717868', 'm', '대구광역시 한글비석로 마들아파트 819호', '010-1772-5984', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손영현', 'ewpe3664', 'zbyq6319', 'zxyz3880@naver.com', '782083-5135592', 'f', '서울특별시 양재로 상동아파트 949호', '010-7944-7796', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강은석', 'zbyz3251', 'toaq2523', 'kjyq2670@gmail.com', '805228-6482767', 'f', '경기도 도이남길 천국빌라 430호', '010-1722-2335', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유광석', 'bggt1163', 'bgpla7834', 'kjpf3059@naver.com', '973396-3578097', 'm', '부산광역시 동부대로 보람아파트 242호', '010-3073-3017', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손은은', 'zmya7072', 'tyaq6766', 'tyfwt1323@daum.net', '589681-3538185', 'f', '강원도 한글비석로 아트빌 996호', '010-7544-4290', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장지진', 'gdfwt3622', 'araq6419', 'zxgt7485@gmail.com', '951893-5462947', 'f', '제주특별자치도 이와대로 센트럴파크 374호', '010-6125-4293', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정태혜', 'kjnz2524', 'kgpf3476', 'ccpb431@naver.com', '722716-5090767', 'f', '광주광역시 남부대로 궁전아파트 804호', '010-3663-4989', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정별다', 'kgyb335', 'klcg1610', 'zxdr9833@daum.net', '531139-6362758', 'f', '광주광역시 죽양대로 해동빌라 660호', '010-3317-7749', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강혜빈', 'gsyb3999', 'gdpf327', 'ewbw3265@daum.net', '772468-5997', 'm', '광주광역시 하온대로 구양아파트 465호', '010-1532-1952', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '최강대', 'ewcg4451', 'zmyz2146', 'gdpla9317@daum.net', '964075-5824621', 'm', '강원도 문화예술길 감동빌라 118호', '010-4797-8083', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노태현', 'zmicm9252', 'gdaq3011', 'tppf8593@gmail.com', '761474-847893', 'm', '대구광역시 죽양대로 상동아파트 31호', '010-7089-3544', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '최운경', 'tunm8806', 'gsyq1616', 'zxpb2146@gmail.com', '528069-4730795', 'f', '경기도 하이대로 한신아파트 719호', '010-1136-1420', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안재보', 'zxnm3237', 'zxyz9640', 'tpaq9976@daum.net', '513797-7273115', 'f', '경기도 한글비석로 행복아파트 594호', '010-2835-4208', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유유대', 'typb6687', 'ccbw8999', 'zmya2094@daum.net', '565045-7973708', 'm', '세종시 포은대로 수락아파트 237호', '010-2287-4808', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강별대', 'tppf4569', 'zndr9770', 'tpna5252@naver.com', '999260-9015173', 'm', '강원도 해안대로 광동아파트 217호', '010-8541-2577', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정보영', 'tiya3795', 'tiya5980', 'gdfs724@gmail.com', '778031-7809375', 'f', '경기도 해안대로 궁전아파트 94호', '010-1049-2495', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유솔석', 'ftpb6019', 'q2pf8622', 'zcna5137@naver.com', '646338-2310550', 'm', '제주특별자치도 조성대로 르티울 496호', '010-2112-6724', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강혜별', 'tocg3852', 'gdpla6605', 'tope2724@gmail.com', '500687-4871944', 'f', '경기도 노해로 천국빌라 627호', '010-6392-8738', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유동준', 'q2fs3002', 'tifs6419', 'klfwt9883@gmail.com', '614590-9194950', 'm', '세종시 하이대로 한신아파트 721호', '010-4084-6608', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안돈다', 'ccfwt4576', 'kgnm4914', 'q2pla579@daum.net', '812249-7508506', 'm', '대구광역시 죽양대로 행복빌라 955호', '010-4479-9319', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '양한슬', 'zbpla7686', 'typf2039', 'kgyb7843@daum.net', '768560-3361168', 'm', '제주특별자치도 외간곡1길 구양아파트 598호', '010-1967-9814', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '김현태', 'gdya4012', 'tuya1015', 'fticm4059@gmail.com', '806831-3787943', 'f', '강원도 북부대로 감동빌라 877호', '010-6594-6081', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노경대', 'tofs4296', 'aryz986', 'tocg4884@naver.com', '609620-6512060', 'm', '세종시 궁예대로 호남아파트 24호', '010-5118-1132', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안우현', 'bgfwt1468', 'gdnm3988', 'zcnfr3113@daum.net', '886078-8990492', 'm', '서울특별시 조성대로 르티울 699호', '010-6609-6391', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조유현', 'zbgt8056', 'zcpb160', 'kjdr9724@gmail.com', '733891-9136103', 'm', '서울특별시 화길 행복빌라 732호', '010-2899-6657', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '이연영', 'tpicm6803', 'kjya2501', 'bgyb5567@gmail.com', '594578-1159558', 'f', '대구광역시 양재로 아트빌 665호', '010-7641-1013', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조솔보', 'gsnz3732', 'zmeb5657', 'kjyq8830@gmail.com', '761272-8573205', 'f', '대전광역시 도이남길 센트럴파크 57호', '010-8259-6198', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유영광', 'tyicm7153', 'gsfwt720', 'tupf4988@gmail.com', '838523-6782171', 'f', '제주특별자치도 해안대로 행복아파트 532호', '010-9212-3809', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안현주', 'gdpe8248', 'bgicm3381', 'arcg4621@naver.com', '654632-4922324', 'm', '제주특별자치도 한글비석로 광동빌라 367호', '010-3547-7036', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노광은', 'tipla4445', 'klnm9061', 'tigt9892@gmail.com', '825891-3085856', 'm', '광주광역시 상계로 한신빌라 223호', '010-5727-5330', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노현민', 'gdfwt586', 'znpf5264', 'gsfwt6785@gmail.com', '538216-2441481', 'm', '세종시 궁예대로 보람빌라 805호', '010-6317-3159', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조은주', 'tyeb4901', 'zbpf5779', 'ccyz6143@gmail.com', '522308-1545618', 'm', '경기도 구미대로 센트럴파크 819호', '010-8029-4523', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '김빈강', 'dsicm257', 'gdicm6895', 'gsyz5300@gmail.com', '638032-7025193', 'f', '대전광역시 동부대로 김양아파트 693호', '010-2799-8769', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안유주', 'kgnz7432', 'kjpe1470', 'gdnm7935@naver.com', '966686-9155299', 'm', '부산광역시 양재로 아트빌 223호', '010-1952-7362', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손슬현', 'kjnfr4326', 'ccfs8526', 'q2nfr3559@gmail.com', '618905-6115754', 'm', '대전광역시 이와대로 호남아파트 308호', '010-5237-6750', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노민보', 'tona4164', 'gsyz9574', 'tucg3061@daum.net', '815453-383015', 'm', '세종시 포은대로 궁전아파트 371호', '010-2675-6814', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조슬빈', 'q2bw9732', 'tufs904', 'zmeb5834@daum.net', '547980-8364265', 'f', '세종시 도이남길 상동아파트 470호', '010-3093-3873', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '최영린', 'tyeb8399', 'zmeb3135', 'zxfwt4629@gmail.com', '791100-3152099', 'f', '제주특별자치도 화길 광동아파트 854호', '010-2147-3515', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '김형다', 'tpnz8116', 'klpb115', 'kjpf6496@naver.com', '957071-4915487', 'm', '대구광역시 양재로 이화아파트 598호', '010-9385-8142', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유연하', 'tupb5652', 'tycg1933', 'gsnz3174@daum.net', '922691-2249802', 'f', '서울특별시 백옥대로 광동빌라 510호', '010-1309-3077', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '박진유', 'bgfs2510', 'kjicm6217', 'klaq3734@naver.com', '896693-9168357', 'f', '부산광역시 하온대로 행복아파트 100호', '010-3490-3396', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안혜운', 'fticm316', 'gsfs3290', 'klaq4055@naver.com', '600896-7280121', 'f', '강원도 서부대로 행복빌라 705호', '010-7548-1674', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '한주경', 'ccyb1653', 'topf9003', 'tpyb9082@gmail.com', '768933-6797421', 'm', '강원도 외간곡1길 행복빌라 795호', '010-7333-9544', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장대빈', 'dsgt6005', 'ftbw7717', 'arya6535@naver.com', '971083-6098390', 'f', '대전광역시 외간곡1길 한신아파트 747호', '010-5291-7083', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정유운', 'zbyb1229', 'q2icm7786', 'bgya5196@daum.net', '627837-326751', 'f', '경기도 하온대로 궁전빌라 241호', '010-3280-2978', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강보다', 'gsyb7727', 'kgya244', 'tupla3391@gmail.com', '741626-850026', 'f', '대전광역시 양재로 궁전아파트 495호', '010-7603-7823', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '김주경', 'kgyq84', 'zmpb7187', 'tudr6903@gmail.com', '510661-3071392', 'f', '강원도 한글비석로 성동빌라 158호', '010-3714-6956', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노석기', 'zbbw9724', 'ccfwt7383', 'zmpla8066@gmail.com', '561884-1885156', 'f', '제주특별자치도 기남대로 아이파크빌라 385호', '010-1123-6960', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '유슬기', 'kgpf5269', 'kgfwt1051', 'tuya5445@gmail.com', '565955-7869600', 'm', '대구광역시 이와대로 한신아파트 777호', '010-9152-9434', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손다은', 'tofs3751', 'kjicm7805', 'tyya2793@naver.com', '986084-8300069', 'f', '서울특별시 북부대로 궁전아파트 939호', '010-7529-5869', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노동슬', 'kjfs3704', 'tupf9572', 'ticg7360@gmail.com', '646982-491590', 'f', '세종시 곡예길 한신아파트 465호', '010-8470-3624', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '박주보', 'klgt9289', 'ftnfr1857', 'tyyq899@gmail.com', '827386-9055653', 'm', '대구광역시 북부대로 김양아파트 616호', '010-3055-1810', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손유준', 'tyyz2219', 'zcpf3951', 'araq730@daum.net', '585877-7719158', 'm', '세종시 기남대로 구양아파트 389호', '010-7980-9846', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손유현', 'znpb1953', 'gdnz3595', 'dsyb4364@daum.net', '806126-5475676', 'm', '세종시 이와대로 보람아파트 599호', '010-4832-1354', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손유지', 'toyq9180', 'tifwt9359', 'arnz2352@naver.com', '639849-7201036', 'f', '경기도 한글비석로 보람빌라 156호', '010-7055-5335', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강슬현', 'kldr1276', 'gsnz5007', 'kjfs2552@daum.net', '882368-231232', 'm', '세종시 남부대로 아트빌 174호', '010-9809-8392', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안현영', 'arnfr1299', 'kjgt326', 'zbeb6231@daum.net', '940772-5974028', 'f', '대전광역시 노해로 구양아파트 484호', '010-8876-3787', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안돈린', 'kgpla304', 'gdpla3257', 'zcpb9251@gmail.com', '907024-9406900', 'm', '서울특별시 하온대로 주양빌라 522호', '010-9894-5717', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '이유다', 'zbfwt2211', 'gspf4002', 'gdgt8284@daum.net', '514956-1451551', 'm', '강원도 남부대로 한신아파트 413호', '010-7706-1652', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정광기', 'kjicm9494', 'tupb7990', 'bggt790@gmail.com', '788998-1651282', 'f', '경기도 남부대로 아트빌 597호', '010-7463-5822', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조연유', 'tonm7891', 'ftyb1528', 'tybw2168@naver.com', '924726-8778205', 'm', '세종시 포은대로 성동빌라 592호', '010-9605-9303', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장별태', 'zbnfr1797', 'ftnm7695', 'tppe950@gmail.com', '884114-8108050', 'f', '대구광역시 곡예길 마들아파트 521호', '010-2178-1209', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '한영한', 'tyaq5113', 'kgya379', 'zcpla8283@naver.com', '672498-9889079', 'f', '서울특별시 남부대로 보람빌라 913호', '010-8503-5185', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손운솔', 'tofs3538', 'tiyq5052', 'kjpla989@gmail.com', '656669-4696970', 'f', '대구광역시 성남대로 르티울 877호', '010-7562-9148', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손영하', 'dsaq5473', 'znpla8099', 'gdfwt3299@naver.com', '504412-4447821', 'f', '광주광역시 포은대로 한신아파트 620호', '010-6736-5325', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손혜은', 'znpf593', 'gsya863', 'kjpb6692@gmail.com', '919232-223879', 'f', '강원도 한글비석로 성동빌라 264호', '010-4874-7886', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '안한동', 'tufs5967', 'kgpf5894', 'tupla7057@daum.net', '517106-978361', 'f', '경기도 문화예술길 아이파크 754호', '010-4078-5478', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '한동강', 'kjnz3187', 'dsfwt9486', 'tynm1777@daum.net', '856156-3249003', 'm', '서울특별시 동부대로 호남아파트 393호', '010-5097-2580', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손돈다', 'tucg2838', 'bgpla5880', 'bgyz3440@daum.net', '792452-797917', 'm', '광주광역시 남부대로 수락아파트 241호', '010-3444-1677', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조영태', 'kgyq3472', 'znfwt9691', 'gsfwt5911@gmail.com', '902470-7164004', 'f', '강원도 성남대로 아이파크빌라 308호', '010-1149-9600', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '김광영', 'toyb9369', 'bggt3047', 'q2na4223@naver.com', '809096-8924799', 'm', '대전광역시 해안대로 수락아파트 745호', '010-1818-7518', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장현현', 'arpla2158', 'tufs6765', 'toeb2371@naver.com', '769915-5621540', 'f', '서울특별시 백옥대로 한신아파트 680호', '010-9811-5951', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '이은경', 'gdpe4576', 'arya3391', 'zxgt6249@gmail.com', '963382-7260674', 'f', '강원도 구미대로 상동아파트 345호', '010-9401-9199', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '박연운', 'ewfs4968', 'ewpla791', 'toicm9343@daum.net', '864051-2212193', 'm', '부산광역시 곡예길 광동아파트 231호', '010-3003-2575', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '박린광', 'znnm3001', 'znicm4086', 'ccdr7589@daum.net', '965517-6516926', 'm', '대전광역시 하온대로 해동빌라 331호', '010-5015-9788', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손은기', 'zmpf4759', 'zmpf9284', 'zxyq2051@naver.com', '646808-4119955', 'm', '제주특별자치도 화길 김양아파트 283호', '010-4546-4300', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강슬형', 'ccfwt8611', 'tppla1180', 'arnm6306@naver.com', '913549-9257881', 'm', '경기도 서부대로 주양빌라 924호', '010-4859-5086', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장석현', 'ftpf5014', 'zcfwt8987', 'ewpla9959@naver.com', '728794-1776421', 'f', '광주광역시 동부대로 호남아파트 265호', '010-3514-2996', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '장현현', 'tiya6338', 'kjfs2083', 'znbw4910@gmail.com', '595656-3114808', 'm', '대구광역시 노해로 성동빌라 101호', '010-9406-9813', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노재태', 'tiyz6823', 'zcnm7547', 'zxyb7606@naver.com', '928526-9685688', 'f', '광주광역시 조성대로 한신빌라 771호', '010-5958-6185', 2);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '노하광', 'kjbw4837', 'kjnfr6595', 'kjpf921@daum.net', '773373-9117996', 'f', '제주특별자치도 기남대로 호남아파트 450호', '010-4488-7705', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손솔현', 'zcbw8598', 'tyyb4048', 'todr8460@daum.net', '652833-6838543', 'm', '경기도 백옥대로 광동아파트 123호', '010-4218-4204', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정혜우', 'tipe3244', 'zmpb3939', 'tope6929@daum.net', '816340-4308785', 'f', '제주특별자치도 해안대로 마들아파트 164호', '010-3969-7279', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '조별지', 'tieb796', 'arpla7742', 'arfwt8715@daum.net', '532398-1940254', 'f', '강원도 조성대로 광동아파트 138호', '010-7585-7489', 1);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '한경연', 'tieb972', 'ccgt8272', 'ewyz8302@naver.com', '534114-5911555', 'm', '대전광역시 성남대로 천국빌라 273호', '010-7064-8483', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '양하은', 'gsya1214', 'ftyb9583', 'kjdr8082@daum.net', '605609-4225924', 'm', '대구광역시 서부대로 김양아파트 786호', '010-5050-2134', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '정경하', 'kgnz6090', 'klfs4290', 'zmcg1237@daum.net', '729236-6320285', 'm', '광주광역시 백옥대로 아이파크 714호', '010-2180-1594', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '강민돈', 'tpfwt2018', 'zmdr6492', 'zxya3120@gmail.com', '794415-8883727', 'f', '제주특별자치도 남부대로 한신아파트 753호', '010-9159-9812', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '최영별', 'ewna2697', 'tocg5462', 'tppla9416@daum.net', '524702-8628994', 'f', '광주광역시 서부대로 센트럴파크 697호', '010-7966-2798', 4);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '손태하', 'arpf6466', 'ewnfr9610', 'q2pf1519@daum.net', '660320-7546432', 'm', '대전광역시 경충대로 한신아파트 928호', '010-3510-4894', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '이경경', 'gsdr5661', 'ccyb807', 'tynfr4785@naver.com', '890813-4186843', 'f', '강원도 해안대로 한신빌라 768호', '010-5741-2640', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '이영경', '0gyeong', 'ccyb807', 'qewga125@naver.com', '990323-4186843', 'f', '강원도 해안대로 한신빌라 768호', '010-5012-2640', 3);
insert into tblMember (memberSeq, name, id, pw, email, jumin, gender, address, tel, memberLvSeq) values (memberSeq.nextVal, '박현주', 'canzoo012', 'ccyb807', 'ashj23@naver.com', '940829-4186843', 'f', '강원도 해안대로 한신빌라 768호', '010-1351-1240', 3);



-- QnA게시판
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 100, 1, '운동할 때 먹으면 좋은 영양제는 무엇이 있을까요?', '종류가 많아서 어떤 비타민을 섭취해야 할지 모르겠어요 비타민C만 먹으면 되는지 종류별로다 사서 먹어야 하는건지요 그리고 언제 먹어야 하나요?', default, '', 1);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 99, 1, '영양제를 오래 먹으면 간에 무리가 갈 수도 있나요?', '관절이 안좋으신 저희 할머니께 건장식품이랑 보호대 선물하고 싶은데~ 어떤 제품이 좋을까요? 추천 부탁드립니다^^ 마사지기도 괜찮은건가요?', default, '', 13);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 98, 1, '영양제를 먹으면 소변 색깔이 노랗게 변하는데 괜찮은 건가요?', '눈도 시리고 뻑뻑한데 감기까지 자주 걸리는거 보니 몸이 안좋은것 같아요ㅠ 추천해주실만한 영양제가 있을까요?', default, '', 4);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 97, 1, '흡연자가 영양제를 먹으면 암 발생 확률이 높아진다던데?', '사실인가요?', default, '', 2);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 96, 1, '유산균을 먹어도 변비가 낫지 않아요', '계속 앉아서 하는 일을 하고 있어서 그런지 몇일 전 부터 허리가 너무 안좋네요 혹시 허리에 좋은 비타민이나 마사지기 추천받고 싶어요~!', default, '', 17);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 95, 1, '요새 잠을 자도 졸리네요', '나이를 먹어서 그런걸 수도 있는데, 자도자도 졸린거같아요 근데 나이들수록 잠이 없어진다 하던만, 저는 왤케 잠이 더 늘어난건지 이럴땐 휴식 취하는거말고 또 뭐라도 챙겨먹어야 하나 싶은데 뭐가 있을까여?', default, '', 34);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 94, 1, '우울증으로 힘들어요', '요즘 코로나 바이러스에 대해 조금이라도 도움이 돌 만한 건강기능식품이 있을까요?', default, '', 25);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 93, 1, '술 마신 다음날 영양제를 먹어도 되나요?', '루테인좀 사볼라구 하는데 어떤게 좋은지 추천좀 해주세요!', default, '', 11);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 92, 1, '비염에도 영양제가 있나요?', '추천 부탁드립니다.', default, '', 19);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 91, 1, '손톱이 갈라지고 잘 부러져요.', '혈당 측정 시 병원에서 잰 수치와 차이가 나는 이유는 뭔가요?', default, '', 27);

insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 90, 2, '영양제를 자주 먹으면 식욕이 좋아져서 살이 더 찌지 않을까요?', '그렇지 않을까요?', default, '', 13);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 89, 2, '채식주의자에게는 어떤 영양제가 필요한가요?', '필요한가요?', default, '', 14);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 88, 2, '간헐적 단식 중에 영양제를 먹으면 단식이 깨질까요?', '깨질까요?', default, '', 15);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 87, 2, '간헐적 단식 중이면 언제 영양제를 복용해야 하나요?', '복용해야 하나요?', default, '', 57);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 86, 2, '보조제나 운동할때 물에 타먹을만한 것?', '뭐가 있을까요?', default, '', 26);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 85, 2, '콤부차 당?', '당 얼마?', default, '', 39);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 84, 2, '이거 아시는 분 있나요?', '있나요?', default, '', 8);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 83, 2, '유산소 무산소', '뭐가 좋은가요', default, '', 5);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 82, 2, '2달에 7키로 빼보신분 있나요?', '방법이랑 같이 먹은 영양제 알려주세요', default, '', 7);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 81, 2, '운동 요요', '영양제로 안오게할 수 있나요?', default, '', 3);

insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 80, 3, '아르기닌을 먹으면 탈모가 온다던데...', '진짜일까요..?', default, '', 1);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 79, 3, '머리가 빠지고 휑해졌어요', '이제 어쩌죠..', default, '', 3);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 78, 3, '어떠한 종류의 샴푸가 있나요?', '추천해주세요', default, '', 4);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 77, 3, '두피샴푸 후 왜 모발이 뻣뻣해지나요?', '이유를 아시나요?', default, '', 9);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 76, 3, '비듬관리 후', '비듬관리 후 지성관리로 넘어가면서 비듬샴푸와 지성샴푸 2개가 되었는데 뭐를 먼저 사용할까요?', default, '', 123);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 75, 3, '탈모샴푸만 사용해도 효과가 있나요?', '효과보신분?', default, '', 26);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 74, 3, '탈모는 없고 두피도 건강한데, 두피 샴푸를 사용할 필요가 있나요?', '있을까요?', default, '', 34);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 73, 3, '모발은 어떻게 자라나는건가요?', '약먹으면 자라나나요?', default, '', 65);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 72, 3, '탈모의 주원인은 무엇인가요?', '무엇일까요?', default, '', 5);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 71, 3, '효과적인 탈모관리방법이 궁금합니다', '아무나 알려주세요', default, '', 19);

insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 70, 4, '다크서클이 심해요', '어떻게 되돌릴 방법이 있을까요?', default, '', 13);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 69, 4, '피부영양제 먹을건데 봐주세요', '추천해주세요', default, '', 18);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 68, 4, '영양제 질문 있습니다', '현재 먹는 영양제 목록이 오메가3 라이코펜 비타민D 아연 아르기닌 이정도가 있는데 여기에 뺄거 있는지 추천해주세요', default, '', 3);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 67, 4, '피부 영양제 선물하려고 하는데', '뭐가 좋을까요?', default, '', 27);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 66, 4, '피부 영양제 도움될지요..', '피부가 많이쳐져 고민입니다.', default, '', 36);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 65, 4, '피부 영양제 중에 세라마이즈업 들어간거 괜찮나요?', '트러블이 자주 올라와요 팩 해도 소용이 없어서 이것저것 찾아봤더니.. 머리만 아프네요..', default, '', 22);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 64, 4, '피부 영양제 추천 좀 부탁드립니다.', '피부가 칙칙하고 좁쌀이 많은 피부에 도움되는 영양제 뭔가요?', default, '', 23);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 63, 4, '피부 영양제 장이랑 피부랑', '요즘 피부가 뒤집어져서 영양제 같이 먹고 있는데 저거 두 개 같이 먹어도 괜찮나요?', default, '', 25);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 62, 4, '낼 모레 40이라 피부가 너무 신경쓰여요', '평소 불면증도 심하고 그러다보니 오타반점도 심해지더군요', default, '', 51);
insert into tblQnaBoard (qnaBoardSeq, memberSeq, qnaCategorySeq, qnaBoardTitle, qnaBoardTxt, qnaBoardDate, qnaBoardImg, qnaBoardChu) values(qnaBoardSeq.nextVal, 61, 4, '영양제 질문 있습니다.', '하루에 몇 알정도 먹어야 하나요?', default, '', 7);




-- Qna댓글
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 1, '정말 좋아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 2, '정리 감사해요. 참고해야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 3, '다른 기본적인 영양소들을 보충하고 싶을 때는 어떤게 좋을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 4, '전 뉴트리디데이 L-아르기닌 추천받아서 먹고 있어요.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 5, '단백질보충제도 과하게 먹으면 간 손상되니까 적당히 드세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 6, 'ㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 7, '일단 운동부터 시작해야하는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 8, '저는 남들이 다 먹길래 그냥 먹어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 9, '효과 좋나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 1, 10, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 11, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 12, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 13, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 14, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 15, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 16, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 17, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 18, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 19, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 2, 20, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 21, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 22, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 23, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 24, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 25, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 26, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 27, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 28, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 29, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 3, 30, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 31, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 32, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 33, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 34, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 35, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 36, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 37, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 38, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 39, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 4, 40, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 41, '저는 계속 졸렸어요...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 42, '요즘 걱정이 많아서 그런지 잠이 안와요..');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 43, '저도 푹자고 싶어요ㅠㅠㅠㅠ 제발');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 44, '어떤가요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 45, '햇빛 많이 보고 억지로라도 밖에 나가는게 최고 인 것 같아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 46, '운동 좋죠!!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 47, '뭔가 몸이 힘들면 아무 생각도 안나서 좋았어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 48, '제 경우는 운동하는게 제일 도움되더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 49, '넵넵! 꼭 극복해욥');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 5, 50, '우리 모두 힘내자구요!!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 51, '저도 처음엔 힘들었는데 진짜 시간이 약이었어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 52, '약 먹는 건 뭔가 거부감이 들어...요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 53, '여러분 산책이 짱이에요bb');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 54, '좋은 정보 감사합니다.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 55, '오히려 영양제 복용이 더 도움이 될 수 있다니');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 56, '술 끊어야 하는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 57, '몸이 점점 쓰레기가 되고 있어요ㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 58, '역시 술이 문제임 ㅋ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 59, '뭐가 문제일까요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 6, 60, '맞아요맞아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 61, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 62, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 63, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 64, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 65, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 66, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 67, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 68, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 69, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 7, 70, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 71, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 72, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 73, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 74, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 75, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 76, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 77, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 78, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 79, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 8, 80, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 81, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 82, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 83, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 84, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 85, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 86, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 87, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 88, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 89, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 9, 90, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 91, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 92, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 93, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 94, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 95, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 96, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 97, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 98, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 99, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 10, 100, '다른 분들은 어떠셨나요?');

insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 11, 1, '정말 좋아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 11, 2, '정리 감사해요. 참고해야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 11, 3, '다른 기본적인 영양소들을 보충하고 싶을 때는 어떤게 좋을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 11, 4, '전 뉴트리디데이 L-아르기닌 추천받아서 먹고 있어요.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 11, 5, '단백질보충제도 과하게 먹으면 간 손상되니까 적당히 드세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 12, 6, 'ㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 12, 7, '일단 운동부터 시작해야하는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 12, 8, '저는 남들이 다 먹길래 그냥 먹어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 12, 9, '효과 좋나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 12, 10, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 13, 11, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 13, 12, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 13, 13, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 13, 14, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 13, 15, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 14, 16, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 14, 17, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 14, 18, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 14, 19, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 14, 20, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 15, 21, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 15, 22, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 15, 23, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 15, 24, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 15, 25, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 16, 26, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 16, 27, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 16, 28, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 16, 29, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 16, 30, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 17, 31, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 17, 32, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 17, 33, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 17, 34, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 17, 35, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 18, 36, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 18, 37, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 18, 38, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 18, 39, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 18, 40, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 19, 41, '저는 계속 졸렸어요...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 19, 42, '요즘 걱정이 많아서 그런지 잠이 안와요..');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 19, 43, '저도 푹자고 싶어요ㅠㅠㅠㅠ 제발');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 19, 44, '어떤가요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 19, 45, '햇빛 많이 보고 억지로라도 밖에 나가는게 최고 인 것 같아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 20, 46, '운동 좋죠!!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 20, 47, '뭔가 몸이 힘들면 아무 생각도 안나서 좋았어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 20, 48, '제 경우는 운동하는게 제일 도움되더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 20, 49, '넵넵! 꼭 극복해욥');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 20, 50, '우리 모두 힘내자구요!!');

insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 21, 51, '저도 처음엔 힘들었는데 진짜 시간이 약이었어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 21, 52, '약 먹는 건 뭔가 거부감이 들어...요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 21, 53, '여러분 산책이 짱이에요bb');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 21, 54, '좋은 정보 감사합니다.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 21, 55, '오히려 영양제 복용이 더 도움이 될 수 있다니');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 22, 56, '술 끊어야 하는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 22, 57, '몸이 점점 쓰레기가 되고 있어요ㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 22, 58, '역시 술이 문제임 ㅋ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 22, 59, '뭐가 문제일까요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 22, 60, '맞아요맞아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 23, 61, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 23, 62, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 23, 63, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 23, 64, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 23, 65, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 24, 66, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 24, 67, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 24, 68, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 24, 69, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 24, 70, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 25, 71, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 25, 72, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 25, 73, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 25, 74, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 25, 75, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 26, 76, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 26, 77, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 26, 78, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 26, 79, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 26, 80, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 27, 81, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 27, 82, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 27, 83, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 27, 84, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 27, 85, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 28, 86, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 28, 87, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 28, 88, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 28, 89, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 28, 90, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 29, 91, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 29, 92, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 29, 93, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 29, 94, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 29, 95, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 30, 96, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 30, 97, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 30, 98, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 30, 99, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 30, 100, '다른 분들은 어떠셨나요?');

insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 1, '정말 좋아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 2, '정리 감사해요. 참고해야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 3, '다른 기본적인 영양소들을 보충하고 싶을 때는 어떤게 좋을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 4, '전 뉴트리디데이 L-아르기닌 추천받아서 먹고 있어요.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 5, '단백질보충제도 과하게 먹으면 간 손상되니까 적당히 드세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 6, 'ㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 7, '일단 운동부터 시작해야하는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 8, '저는 남들이 다 먹길래 그냥 먹어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 9, '효과 좋나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 31, 10, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 11, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 12, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 13, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 14, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 15, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 16, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 17, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 18, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 19, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 32, 20, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 21, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 22, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 23, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 24, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 25, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 26, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 27, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 28, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 29, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 33, 30, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 31, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 32, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 33, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 34, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 35, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 36, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 37, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 38, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 39, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 34, 40, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 41, '저는 계속 졸렸어요...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 42, '요즘 걱정이 많아서 그런지 잠이 안와요..');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 43, '저도 푹자고 싶어요ㅠㅠㅠㅠ 제발');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 44, '어떤가요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 45, '햇빛 많이 보고 억지로라도 밖에 나가는게 최고 인 것 같아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 46, '운동 좋죠!!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 47, '뭔가 몸이 힘들면 아무 생각도 안나서 좋았어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 48, '제 경우는 운동하는게 제일 도움되더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 49, '넵넵! 꼭 극복해욥');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 35, 50, '우리 모두 힘내자구요!!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 51, '저도 처음엔 힘들었는데 진짜 시간이 약이었어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 52, '약 먹는 건 뭔가 거부감이 들어...요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 53, '여러분 산책이 짱이에요bb');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 54, '좋은 정보 감사합니다.');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 55, '오히려 영양제 복용이 더 도움이 될 수 있다니');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 56, '술 끊어야 하는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 57, '몸이 점점 쓰레기가 되고 있어요ㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 58, '역시 술이 문제임 ㅋ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 59, '뭐가 문제일까요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 36, 60, '맞아요맞아요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 61, '요즘 아르기닌 많이 보이던데......');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 62, '답이 없는 문제죠.....');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 63, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 64, '정보 감사합니다~~');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 65, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 66, '정보 공유 부탁드립니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 67, '부작용 조심');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 68, '그래도 탈모는 잘못된 정보라니 다행이다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 69, '헉');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 37, 70, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 71, '그렇군요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 72, '한 번 드셔보세요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 73, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 74, '신기하네요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 75, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 76, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 77, '그냥 담배를 안피는게?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 78, '좋은 정보 감사합니다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 79, '오 여자는 상관 없군요!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 38, 80, '좋은 정보!');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 81, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 82, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 83, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 84, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 85, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 86, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 87, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 88, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 89, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 39, 90, '다른 분들은 어떠셨나요?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 91, '부작용이 덜하다고 해서 먹어보긴 했는데');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 92, '개개인마다 맞는 유산균이 따로 있다고 해요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 93, '내가 잘 안움직여서 그렇군');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 94, '바나나, 고구마 같은거 많이 먹고 있는데...');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 95, '매일 속이 안좋은것 같고 더부룩했었는데 달리기 시작하고 나아졌어요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 96, '아는 사람만 안다는 변비의 고통');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 97, '스트레스가 줄어드니까 잠자는데 문제는 없더라고요');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 98, '스트레스 많이 받고 예민한 편인데 테아닌 먹어봐야겠다');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 99, '자기 전에 휴대폰 안보고 스트레스 안받는게 제일 좋지 않을까욥?');
insert into tblQnaComment (qnaCommentSeq, qnaBoardSeq, memberSeq, qnacommentTxt) values(qnaCommentSeq.nextVal, 40, 100, '다른 분들은 어떠셨나요?');



-- 자유게시판
insert into tblFreeBoard(freeBoardSeq, freeBoardTitle, freeBoardTxt, freeBoardDate, freeBoardImg, freeBoardChu, memberSeq) values(freeBoardSeq.nextVal, '무릎관절 영양제 뭐가 좋나요?', '무릎관절 영양제 좋을거 같아서요. 혈압약 정도 드시고 있는데 무릎관절 영양제 먹어도 괜찮을까요?', default, '', 60, 50);
insert into tblFreeBoard(freeBoardSeq, freeBoardTitle, freeBoardTxt, freeBoardDate, freeBoardImg, freeBoardChu, memberSeq) values(freeBoardSeq.nextVal, '아연 영야제 제대로 된걸로요', '제가 요새 면역력이 너무 안좋아져서 아연 영양제로 괜찮은 걸로 알아보고있는데', default, '', 2, 51);
insert into tblFreeBoard(freeBoardSeq, freeBoardTitle, freeBoardTxt, freeBoardDate, freeBoardImg, freeBoardChu, memberSeq) values(freeBoardSeq.nextVal, '종합비타민 먹어보고 싶은데요..', '종합비타민을 챙겨 먹으면 도움이 될까 싶어 여러 제품을 찾아봤는데 뉴트리코어 종합비타민이 좋다고 하더라고요', default, '', 45 , 52);
insert into tblFreeBoard(freeBoardSeq, freeBoardTitle, freeBoardTxt, freeBoardDate, freeBoardImg, freeBoardChu, memberSeq) values(freeBoardSeq.nextVal, '비타민 이거 다 먹어두 되나요?', '멀티비타민이랑 오메가3만 먹고 궁금해서 여기에 올립니다.', default, '', 71, 53);
insert into tblFreeBoard(freeBoardSeq, freeBoardTitle, freeBoardTxt, freeBoardDate, freeBoardImg, freeBoardChu, memberSeq) values(freeBoardSeq.nextVal, '비타민 복용', '비타민C와 비타민D를 같이 복용해도 될까요?', default, '', 22, 54);
select * from tblFreeBoard;

-- 자유게시판댓글
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 1, '정말 좋아요', 3);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 1, '정리 감사해요. 참고해야겠다', 2);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 1, '다른 기본적인 영양소들을 보충하고 싶을 때는 어떤게 좋을까요?', 43);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 1, '전 뉴트리디데이 L-아르기닌 추천받아서 먹고 있어요.', 78);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 1, '단백질보충제도 과하게 먹으면 간 손상되니까 적당히 드세요', 13);

insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 2, 'ㅠㅠㅠㅠㅠㅠㅠ', 12);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 2, '일단 운동부터 시작해야하는데', 33);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 2, '저는 남들이 다 먹길래 그냥 먹어요', 22);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 2, '효과 좋나요?', 27);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 2, '요즘 아르기닌 많이 보이던데......', 29);

insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 3, '답이 없는 문제죠.....', 48);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 3, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ', 55);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 3, '정보 감사합니다~~', 31);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 3, '평소에는 괜찮은데 스트레스 받으면 갑자기 pms가 생기는데 왜 그래요?', 41);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 3, '정보 공유 부탁드립니다', 89);

insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 4, '부작용 조심', 98);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 4, '그래도 탈모는 잘못된 정보라니 다행이다', 78);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 4, '헉', 49);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 4, '잘못 먹으면 위염 생길 수도 있대요', 27);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 4, '그렇군요', 39);

insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 5, '한 번 드셔보세요', 20);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 5, '시금치, 당근, 토마토 같은 음식에 베타카로틴이 들어가 있다고 해요', 90);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 5, '신기하네요', 48);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 5, '헐 왜 음식으로 섭취하면 괜찮을까요?', 44);
insert into tblFreeCommentBoard values(freeCommentSeq.nextVal, 5, '담배.. 빨리 끊어야 할텐데ㅠㅠ 잘 안되네여', 32);




-- 비회원 장바구니
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 1 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 3 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 2 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 6 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 10 , 2);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 5 , 3);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 2 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 11 , 2);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 3 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 5 , 2);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 2 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 6 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 9 , 2);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 12 , 3);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 7 , 1);
insert into tblNonmemberBasket values (nonmemberbasketSeq.nextVal, 4 , 2);




--비회원 주문상세 정보
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 1 , 2, '홍길동','01012345678','서울특별시 구의동 이길3로 25', '부재시, 집 앞에 놔주세요', '신용카드', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 2 , 1, '무동화','01038372615','서울특별시 구의동 칠길3로 27', '부재시, 집 앞에 놔주세요', '신용카드', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 3 , 3, '정길이','01098742278','서울특별시 구의동 오길2로 15', '부재시, 집 앞에 놔주세요', '계좌이체', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 4 , 4, '이길삼','01012001298','서울특별시 구의동 삼길10로 61', '부재시, 집 앞에 놔주세요', '카카오페이', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 5 , 3, '신이동','01015983678','서울특별시 구의동 일길31로 18', '부재시, 집 앞에 놔주세요', '카카오페이', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 6 , 4, '이홍훈','01012018262','서울특별시 구의동 이십길3로 15', '부재시, 집 앞에 놔주세요', '신용카드', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 7 , 2, '구구고','01012047678','서울특별시 구의동 삼이길3로 501', '부재시, 집 앞에 놔주세요', '계좌이체', default);
insert into tblNonmemberOrder values (nonmemberOrderSeq.nextVal, 8 , 1, '최익현','01016734678','서울특별시 구의동 구구길3로 102', '부재시, 집 앞에 놔주세요', '신용카드', default);




-- 후기
insert into tblReview values(reviewSeq.nextVal, 2, 4 ,2, '정말 좋아요');
insert into tblReview values(reviewSeq.nextVal, 54, 3, 3, '일단 운동부터 시작해야하는데');
insert into tblReview values(reviewSeq.nextVal, 3, 6, 2, '저는 남들이 다 먹길래 그냥 먹어요');
insert into tblReview values(reviewSeq.nextVal, 51, 13, 4, '잘못 먹으면 위염 생길 수도 있대요');
insert into tblReview values(reviewSeq.nextVal, 43, 25, 2, '그렇군요');
insert into tblReview values(reviewSeq.nextVal, 65, 36, 5, '한 번 드셔보세요');
insert into tblReview values(reviewSeq.nextVal, 22, 41, 1, '신기하네요');
insert into tblReview values(reviewSeq.nextVal, 89, 22, 4, '헐 왜 음식으로 섭취하면 괜찮을까요?');
insert into tblReview values(reviewSeq.nextVal, 23, 33, 1, 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠ');
insert into tblReview values(reviewSeq.nextVal, 11, 11, 2, '단백질보충제도 과하게 먹으면 간 손상되니까 적당히 드세요');




-- 마이페이지 데이터
insert into tblMypage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 1);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 1000, '실버', 2);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, 'VIP', 3);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '골드', 4);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 5);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 1000, '베이직', 6);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 6000, '실버', 7);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '실버', 8);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, 'VIP', 9);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '베이직', 10);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 8000, '베이직', 11);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 12);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 8000, '베이직', 13);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 6000, '베이직', 14);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, 'VIP', 15);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '실버', 16);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '베이직', 17);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 8000, '실버', 18);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '골드', 19);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 20);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '실버', 21);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '실버', 22);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '베이직', 23);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '실버', 24);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '골드', 25);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '실버', 26);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 8000, 'VIP', 27);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 28);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 1000, '실버', 29);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '골드', 30);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '베이직', 31);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '골드', 32);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 1000, '골드', 33);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '실버', 34);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 6000, '베이직', 35);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, 'VIP', 36);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 37);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '실버', 38);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 39);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 40);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 41);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '골드', 42);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 43);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 44);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, 'VIP', 45);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '베이직', 46);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 47);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 8000, '골드', 48);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '실버', 49);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 50);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 6000, '골드', 51);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 52);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '베이직', 53);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, 'VIP', 54);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '실버', 55);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 56);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 57);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '베이직', 58);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 59);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '실버', 60);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 61);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '골드', 62);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, 'VIP', 63);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 64);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 65);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '베이직', 66);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 67);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 68);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, 'VIP', 69);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '골드', 70);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 71);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '골드', 72);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 73);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 74);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, 'VIP', 75);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '베이직', 76);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 77);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 5000, '골드', 78);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 79);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 6000, '골드', 80);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 81);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, '실버', 82);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 83);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 7000, 'VIP', 84);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 85);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '베이직', 86);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 87);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 88);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 89);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '골드', 90);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '베이직', 91);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 4000, '골드', 92);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '실버', 93);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 94);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 95);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, 'VIP', 96);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 97);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '실버', 98);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 2000, '골드', 99);
insert into tblMyPage (mypageSeq, mypagePoint, mypageRank, memberSeq) values (mypageSeq.nextVal, 3000, '베이직', 100);





-- 회원장바구니
insert into tblMemberCart values (memberCartSeq.nextVal, 1, 1, 11);
insert into tblMemberCart values (memberCartSeq.nextVal, 5, 2, 3);
insert into tblMemberCart values (memberCartSeq.nextVal, 3, 3, 7);
insert into tblMemberCart values (memberCartSeq.nextVal, 4, 4, 10);
insert into tblMemberCart values (memberCartSeq.nextVal, 1, 5, 2);
insert into tblMemberCart values (memberCartSeq.nextVal, 12, 7, 1);
insert into tblMemberCart values (memberCartSeq.nextVal, 32, 9, 2);
insert into tblMemberCart values (memberCartSeq.nextVal, 23, 11, 4);
insert into tblMemberCart values (memberCartSeq.nextVal, 54, 15, 3);
insert into tblMemberCart values (memberCartSeq.nextVal, 30, 33, 3);



--관심상품
insert into tblLikeProduct values (likeProductSeq.nextVal, 1 , 12);
insert into tblLikeProduct values (likeProductSeq.nextVal, 3 , 4);
insert into tblLikeProduct values (likeProductSeq.nextVal, 10 , 5);
insert into tblLikeProduct values (likeProductSeq.nextVal, 12 , 2);
insert into tblLikeProduct values (likeProductSeq.nextVal, 5 , 10);
insert into tblLikeProduct values (likeProductSeq.nextVal, 8 , 12);
insert into tblLikeProduct values (likeProductSeq.nextVal, 9 , 3);
insert into tblLikeProduct values (likeProductSeq.nextVal, 13 , 15);
insert into tblLikeProduct values (likeProductSeq.nextVal, 11 , 12);
insert into tblLikeProduct values (likeProductSeq.nextVal, 6 , 11);
insert into tblLikeProduct values (likeProductSeq.nextVal, 51 , 12);
insert into tblLikeProduct values (likeProductSeq.nextVal, 43 , 4);
insert into tblLikeProduct values (likeProductSeq.nextVal, 30 , 5);
insert into tblLikeProduct values (likeProductSeq.nextVal, 62 , 2);
insert into tblLikeProduct values (likeProductSeq.nextVal, 75 , 10);
insert into tblLikeProduct values (likeProductSeq.nextVal, 18 , 12);
insert into tblLikeProduct values (likeProductSeq.nextVal, 29 , 23);
insert into tblLikeProduct values (likeProductSeq.nextVal, 33 , 19);
insert into tblLikeProduct values (likeProductSeq.nextVal, 61 , 22);
insert into tblLikeProduct values (likeProductSeq.nextVal, 26 , 17);



-- 영양성분
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,5, 1,'50(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,16, 1,'40(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,20, 1,'50(mcg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,2, 2,'1000000000(CFU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,6, 4,'300(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,14, 4,'150(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,7, 4,'10(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,3, 5,'600(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 5,'7.5(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,25, 6,'100(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,29, 7,'10(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,11, 7,'3(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,40, 8,'130(g)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,43, 9,'120(g)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,4, 10,'210(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,90, 11,'2(g)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 13,'6(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,2, 15,'1000000000(CFU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,2, 16,'500000000(CFU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,6, 17, '49(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,22, 17, '500(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,52, 18, '2000(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,14, 19, '115(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,6, 19, '252(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 19, '2(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,3, 20, '150(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 20, '3(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,7, 21, '500(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,42, 25, '240(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,62, 26, '240(mcg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,4, 27, '500(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,3, 27, '100(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 27, '24(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,7, 30, '1000(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,7, 31, '2000(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 31, '10(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,13, 32, '20(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,16, 32, '1(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,8, 32, '10(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,5, 33, '1(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,8, 33, '1.5(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,7, 33, '250(IU)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,22, 33, '5(mg)' );
insert into TBLNUTRITIONALINGREDIENTS (nutritionalIngredientsSeq, ingredientSeq, productSeq, nutritionalIntake) values (nutritionalIngredientsSeq.nextVal,17, 33, '12(mg)' );





-- 회원 주문 상세정보
insert into tblMemberOrder values (memberOrderSeq.nextVal, 1, 1, 1, '서울특별시 한글비석로 행복빌라 B01호', '배송전 연락부탁합니다', '홍길동', '카드', default); 
insert into tblMemberOrder values (memberOrderSeq.nextVal, 2, 2, 1, '부산광역시 하온대로 아이파크 474호', '배송전 연락부탁합니다', '이미나', '카카오페이', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 3, 3, 1, '경기도 노해로 감동빌라 25호', '오실때 조심히 오세요', '이해영', '카드', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 4, 4, 1, '부산광역시 성남대로 감동빌라 869호', '배송전 연락부탁합니다', '한주유', '카드', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 5, 5, 1, '세종시 한글비석로 한신아파트 651호', '문앞에 두고 가주세요.', '강보동', '카카오페이', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 7, 6, 1, '대구광역시 한글비석로 마들아파트 819호', '배송전 연락부탁합니다', '양별은', '휴대폰결제', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 9, 7, 1, '서울특별시 양재로 상동아파트 949호', '배송전 연락부탁합니다', '양영영', '휴대폰결제', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 11, 8, 1, '강원도 한글비석로 아트빌 996호', '문앞에 두고 가주세요.', '강은석', '카드', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 15, 9, 1, '광주광역시 하온대로 구양아파트 465호', '오실때 조심히 오세요', '김이유', '카드', default);
insert into tblMemberOrder values (memberOrderSeq.nextVal, 33, 10, 1, '강원도 문화예술길 감동빌라 118호', '배송전 연락부탁합니다', '강호동', '카드', default);



-- 구독
insert into tblSubscribe values(subsSeq.nextVal, 5, 2, 2, default);
insert into tblSubscribe values(subsSeq.nextVal, 4, 4, 4, default);
insert into tblSubscribe values(subsSeq.nextVal, 32, 9, 7, default);
insert into tblSubscribe values(subsSeq.nextVal, 23, 11, 8, default);
insert into tblSubscribe values(subsSeq.nextVal, 30, 33, 10, default);



-- 수정
update tblnotice set noticeimg = 'notice01.jpg' where noticeseq = 1;
update tblnotice set noticeimg = 'notice02.jpg' where noticeseq = 2;
update tblnotice set noticeimg = 'notice03.jpg' where noticeseq = 3;
update tblnotice set noticeimg = 'notice04.jpg' where noticeseq = 4;
update tbltip set tipimg = 'tip1.jpg' where tipseq = 1;
update tbltip set tipimg = 'tip2.jpg' where tipseq = 2;
update tbltip set tipimg = 'tip3.jpg' where tipseq = 3;


commit;