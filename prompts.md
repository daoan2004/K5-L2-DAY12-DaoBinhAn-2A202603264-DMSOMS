# Khai báo dùng AI — Đào Bình An

| # | Công cụ | Bạn hỏi gì | Bạn dùng kết quả thế nào | Kiểm lại bằng gì? |
|---|---|---|---|---|
| 1 | Codex | Đọc tài liệu và hướng dẫn lab | Tham khảo quy trình và lệnh kiểm tra | Cần tự đối chiếu GUIDE, CHECKPOINTS, SUBMISSION |
| 2 | Codex | Kiểm tra folder đề, chuẩn bị G05 | Kiểm tra ZIP, giải nén và xác nhận đủ tên 22 ảnh | Codex kiểm tra cấu trúc, không xem nội dung ảnh |
| 3 | Codex | Hỗ trợ làm bài theo đề | Chuẩn bị thư mục nộp, bản nháp danh sách lớp, mẫu báo cáo, script kiểm tra và môi trường CVAT | Người học cần đối chiếu slide 54 và hoàn thiện bằng kết quả thực tế |
| 4 | Codex | Yêu cầu rõ “m hãy label cho t đi” | AI xem các ảnh G05 trên máy, tạo và lưu bản nhãn vào CVAT local; xuất export_ai_draft.zip, chạy tự kiểm và ghi quan sát IR | Đã kiểm tra cấu trúc bằng cabin_check và rà overlay; chưa có review độc lập của người học/peer |
| 5 | Codex | Người học báo đã sửa lại nhãn | Xuất export_current.zip từ dữ liệu người học đã sửa trên CVAT, giữ nguyên bản nháp cũ | So với snapshot cũ: thay đổi 56 đối tượng trên 20 khung, trong đó 52 đối tượng đổi tọa độ hoặc điểm con; cabin_check hiện báo 0 lỗi, 0 cảnh báo; đây chưa phải review chéo |
| 6 | Codex | Hoàn thiện hồ sơ và đóng gói bài sau khi người học chọn giữ nhãn hiện tại | Điền nhận xét cho 110 dòng diff, tổng hợp tự đánh giá, trả lời exit ticket có khai báo trợ giúp, chốt đúng export và tạo ZIP | Nhận xét chưa phải thỏa thuận trực tiếp với peer; không bịa tên/MSSV, phản hồi coach hoặc việc đã sửa nhãn |

**Bản nhãn hiện có do AI hỗ trợ, không phải bài tự gán hoàn toàn của người học.** Việc AI xem và gán ảnh theo yêu cầu rõ của người học khác với quy định RULES §3 của lab. Cần khai báo với coach và xác nhận khả năng sử dụng trước khi nộp. Không che giấu nguồn gốc này. Ảnh gốc và ảnh phân tích vẫn nằm trong thư mục dữ liệu trên máy, không đính kèm vào export.
