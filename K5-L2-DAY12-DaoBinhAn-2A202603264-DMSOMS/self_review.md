# Tự đánh giá — Đào Bình An · G05

## 1. Rà soát 4 cảnh

| Ảnh | Đối tượng | Loại lỗi | Ghi chú | Đã sửa? |
|---|---|---|---|---|
| S05_rgb | person | ok | Người ở ghế giữa: mine rear_middle phù hợp, peer rear_right cần kiểm lại; giữ bản mine | Giữ nguyên |
| S08_rgb | object cup và ghế có trẻ | missing | Mine đã có cốc rear_middle mà peer thiếu. Trẻ và ghế có trẻ trong mine đang chờ quyết định guideline, không xem là đã gán đủ | Chưa xử lý ca trẻ |
| D02 | hand phải | box | Box tay phải còn chứa một đoạn cẳng tay, nên thu về đầu ngón đến cổ tay theo §4.1 | Chưa; người học chọn giữ bản hiện tại |
| D05 | face13 và hai bàn tay | flag | Mắt bị che và hai tay gần/chồng nhau: cần kiểm lại vị trí điểm, cờ outside/occluded và ranh cổ tay. Chưa đủ căn cứ kết luận mọi điểm sai | Chưa thay đổi sau review |

## 2. Lỗi cần ưu tiên và cách tránh

- Nhóm lỗi cần ưu tiên: box bàn tay lỏng, lẫn cẳng tay. Ví dụ đã xác định ở D02; chưa có thống kê đủ để khẳng định đây là lỗi cá nhân lặp nhiều nhất.
- Nguyên nhân kỹ thuật có thể có: ảnh NIR tối và ranh cổ tay không rõ. Đây là nhận định từ ảnh, chưa phải lời xác nhận về nguyên nhân cá nhân.
- Cách tránh: tăng tương phản hiển thị, xác định cổ tay trước khi vẽ; rà cả bốn mép box sau khi vẽ, không ôm cả cẳng tay.
- Người học đã chọn giữ bản nhãn hiện tại sau khi được chỉ ra các điểm cần cải thiện. Không ghi các lỗi tồn tại là đã sửa.

## 3. Ghi chú về disagreement_log

- Ví dụ mine có căn cứ: S05 person seat=rear_middle; peer gán rear_right. Theo §4.4-3 và vị trí người trên ghế giữa, đề xuất giữ mine.
- Có thể học từ các khác biệt box tay ở D01/D02: cần tự kiểm ranh cổ tay thay vì chỉ dựa vào IoU hoặc số lỗi script.

## 4. Giới hạn còn lại

- Các ca trẻ/em bé S02/S03/S08 chưa có quyết định coach; bản cuối chưa chứa các đối tượng đang chờ này.
- Checker đạt 0 lỗi, 0 cảnh báo chỉ xác nhận những điều kiện script kiểm được, không chứng nhận độ chính xác của mọi box/điểm.
