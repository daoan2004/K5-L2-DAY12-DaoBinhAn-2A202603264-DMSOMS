# Danh sách lớp v0 — Đào Bình An · G05

## DMS

| # | Lớp / thuộc tính | Giá trị | Để làm gì | Nhìn thấy được trên IR? |
|---|---|---|---|---|
| 1 | face / eye_left, eye_right | open / closed / unknown | Theo dõi từng mắt; cần chuỗi khung để xét nhắm mắt kéo dài | Có khi rõ mí; bị che thì unknown |
| 2 | face / gaze_zone | road / mirror_l / mirror_r / mirror_c / cluster / center / lap / other | Theo dõi vùng chú ý tài xế | Dựa mắt và đầu; không chắc dùng other và ghi lý do |
| 3 | face / glasses | unknown / none / clear / sun | Nhận biết kính để đánh giá khả năng quan sát mắt | Có giới hạn; kính râm trên NIR có thể trông trong suốt |
| 4 | face13 | 13 điểm, cờ occluded / outside | Định vị chi tiết mặt hỗ trợ phân tích mắt và tư thế đầu | Khi mặt đủ lớn và rõ; không đặt điểm cho đủ |
| 5 | hand / whose, side, on_wheel | driver / passenger; left / right; yes / no / unknown | Xác định tay và việc chạm vô lăng | Khi rõ tay và vùng tiếp xúc |
| 6 | phone / state | held / mounted / lap | Nhận biết điện thoại và trạng thái sử dụng | Phải thấy cạnh, góc hoặc màn hình |
| 7 | person / seatbelt | worn_correct / worn_incorrect / not_worn / unknown | Hỗ trợ kiểm tra dây an toàn tài xế | Khi rõ đường đi dây; bị che thì unknown |

## OMS

| # | Lớp / thuộc tính | Giá trị | Để làm gì | Nhìn thấy được trên IR? |
|---|---|---|---|---|
| 1 | person / seat | driver / front_passenger / rear_left / rear_middle / rear_right | Xác định vị trí người trong cabin | Qua hình dạng và vị trí, tùy che khuất |
| 2 | face | rectangle; OMS chỉ box | Bổ sung vị trí mặt người lớn nhìn thấy | Khi mặt đủ rõ |
| 3 | child_seat / occupied | no / unknown, kèm seat | Nhận biết ghế trẻ em trống và vị trí | Theo hình dạng; lab không có occupied=yes |
| 4 | infant_seat / facing | rear / front, kèm seat | Nhận biết nôi xách và hướng đặt | Khi thấy rõ cấu trúc và hướng ghế |
| 5 | object / type | bag / box / cup / other, kèm seat | Phân biệt đồ vật với người và xác định vị trí | Theo hình dạng, không dựa màu |
| 6 | person / seatbelt | worn_correct / worn_incorrect / not_worn / unknown | Kiểm tra dây an toàn theo người | Có giới hạn; SVIRO chỉ not_worn / unknown |

## 2 câu hỏi leo thang


1. Câu hỏi: Bộ G05 có trẻ em/em bé trong ghế, khác mô tả “không có trẻ em ngồi”. Cần đổi bộ ảnh, loại khung hay mở rộng guideline? Nếu mở rộng thì gán cả person và ghế, và occupied dùng giá trị nào khi schema không có yes?
   Khung ví dụ: G05 S02_rgb / S02_ir, ghế rear_left; S03_rgb / S03_ir, ghế rear_right; S08_rgb / S08_ir, ghế rear_left.
   Tạm xử lý trong bản AI: Chưa gán trẻ và ghế đang có trẻ; ghi vào danh sách ca cần hỏi coach, không ghi occupied=no hoặc unknown nhằm lách trường hợp chưa có trong guideline.
2. Câu hỏi: Mặt nghiêng xuống/đi xa camera, thấy gọng kính và má nhưng không xác định được cả mắt lẫn mũi, có được bỏ face hoàn toàn theo §4.5 dù khung DMS thường yêu cầu face13?
   Khung ví dụ: G05 D04.
   Tạm xử lý trong bản AI: Giữ person và hai hand; không vẽ face/face13 vì không đủ dấu hiệu theo §4.5; ghi ca cần người học và coach xác nhận.
