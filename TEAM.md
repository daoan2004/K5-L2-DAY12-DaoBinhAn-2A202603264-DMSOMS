# TEAM — Ngày 12

Mã bộ ảnh: **G05**. Bài nộp riêng của **Đào Bình An — 2A202603264**.

Hình thức cá nhân/nhóm: chưa được cung cấp rõ, cần người học bổ sung.

| Họ tên | MSSV | Phạm vi bài | Review chéo với | Số dòng đã xem xét |
|---|---|---|---|---|
| Đào Bình An | 2A202603264 | 22 khung có nhãn; 3 cảnh có trẻ/em bé chưa giải quyết phạm vi gán | Nguyễn Hồ Bắc — MSSV **03351**, tài khoản CVAT `bac`; thông tin do người học xác nhận | 110 dòng có nhận xét: 34 đề xuất có kết luận, 76 ambiguous |

## Cá nhân

### DaoBinhAn-2A202603264

- Công việc có bằng chứng: người học đã sửa bản nhãn trên CVAT; so với bản nháp có 56 đối tượng thay đổi trên 20 khung, gồm 52 đối tượng đổi tọa độ/điểm con. Export cuối dùng đúng bản người học tải về.
- Review: đã dùng script so `export_current.zip` của người học với export của peer, hiện lưu riêng tại `artifacts/peer_export_final.zip` trên máy. Nhận xét và verdict hiện do AI hỗ trợ đối chiếu guideline; chưa xác nhận hai người đã thảo luận hay đồng ý từng dòng.
- Bài học kỹ thuật từ đối chiếu: cùng qua checker không có nghĩa cùng đúng; ví dụ S05 khác seat và DMS có object thừa trong bản peer.
- Hỗ trợ AI và các giới hạn được khai báo trong prompts.md.

## Ca cần hỏi coach

- S02 và S08: trẻ trong ghế rear_left; S03: em bé trong nôi rear_right. Dữ liệu khác mô tả đề, chưa có quy tắc gán trẻ/ghế có trẻ.
- S04: khác cách phân loại child_seat/infant_seat ở rear_right.
- D04: bỏ face/face13 khi không thấy rõ cả mắt lẫn mũi theo §4.5, cần xác nhận.

Chưa ghi đã hỏi coach hoặc peer đã sửa vì chưa có bằng chứng đó.
