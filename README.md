# Bài nộp Ngày 12 — Đào Bình An — 2A202603264

Mã bộ ảnh: **G05**. Người review: **Nguyễn Hồ Bắc — MSSV 03351**.
Các file bài nộp nằm ngay tại gốc repo; dữ liệu ảnh và bản export của peer chỉ giữ trên máy.

| Bằng chứng | File |
|---|---|
| E1 — Nhãn của người học, 22 khung, không kèm ảnh | [export_final.zip](export_final.zip) |
| E2 — Kết quả kiểm tra | [Checkpoint A](check_cpA.txt), [Checkpoint B](check_cpB.txt), [Kiểm cuối](check_final.txt) |
| E3 — So sánh với bản peer | [disagreement_log.csv](disagreement_log.csv) |
| E4 — Quan sát IR | [ir_log.csv](ir_log.csv) |
| E5 — Danh sách lớp và câu hỏi guideline | [class_list_v0.md](class_list_v0.md) |
| Hồ sơ bổ sung | [TEAM.md](TEAM.md), [self_review.md](self_review.md), [exit_ticket.md](exit_ticket.md), [prompts.md](prompts.md) |

Kiểm cuối: **22 ảnh, 22 frame_meta, 0 lỗi, 0 cảnh báo**. Export chỉ chứa `annotations.xml`.
Review có 110 dòng nhận xét: 34 đề xuất kết luận và 76 trường hợp `ambiguous` chưa thống nhất.
Bản nhãn có AI hỗ trợ và được người học sửa lại; quá trình được khai báo trong `prompts.md`.
Các ca trẻ/em bé S02/S03/S08 chưa có kết luận coach và box tay D02 còn cần cải thiện;
xem [annotation_notes.txt](annotation_notes.txt) và [self_review.md](self_review.md).
Những giới hạn này không được kiểm chứng chỉ bằng kết quả 0 lỗi của script.

Chạy kiểm tra từ gốc repo (Python 3.9+):

```powershell
python scripts/cabin_check.py check export_final.zip --expect 22
```

Repo không chứa manifest dữ liệu. Khi kiểm trên máy có G05, có thể bổ sung
`--manifest G05/oms/manifest.csv`. Nộp **link repo này** lên LMS theo thông báo của coach.

---

# Tài liệu gốc — Lab Ngày 12: DMS & OMS

AI20K K5 · L2 · Ngày 12 · 14:00–18:00 · CVAT chạy trên máy của bạn · làm **cá nhân hoặc nhóm 2–4 người**

Bạn gán nhãn **22 khung hình** cabin (tối đa 26) theo Guideline Cabin v1.0. Sau đó bạn tự kiểm bằng script `cabin_check`, đổi file export với một bạn để đối chiếu, rồi sửa lại. Cuối buổi bạn ghi những gì ảnh hồng ngoại (IR) làm mất so với ảnh màu, và viết bản nháp danh sách lớp cho model DMS/OMS.

## Đọc theo thứ tự

| Khi nào | File | Nội dung |
|---|---|---|
| **Trước buổi học, chậm nhất T-3** | [INSTALL_CVAT.md](INSTALL_CVAT.md) | Cài CVAT local, tạo tài khoản, thử mở `localhost:8080` |
| Trước buổi học | [GUIDE.md](GUIDE.md) | Đề bài, Guideline Cabin v1.0, các task |
| Đầu buổi | [RULES.md](RULES.md) | Cá nhân hay nhóm, dùng AI, giữ ảnh trong lớp |
| Trong buổi | [CHECKPOINTS.md](CHECKPOINTS.md) | Lệnh `cabin_check` ở Checkpoint A, B và lần cuối |
| Khi kẹt | [COMMON_ERRORS.md](COMMON_ERRORS.md) | Lỗi hay gặp và cách tự gỡ |
| Trước khi nộp | [SUBMISSION.md](SUBMISSION.md), [RUBRIC.md](RUBRIC.md) | Nộp gì (E1–E5), chấm thế nào |
| Mẫu điền | [templates/](templates/) | `ir_log.csv`, `class_list_v0.md`, `self_review.md`, `TEAM.md`, `prompts.md`, `exit_ticket.md` |

## Bạn nhận được gì

Repo này (tài liệu, mẫu điền, script `cabin_check`) và thư mục ảnh `Gxx/` của mã bạn được giao. Dùng gói ảnh của nhóm (`Gxx.zip`). Giải nén rồi chép thư mục `Gxx/` vào **trong** thư mục repo này. `.gitignore` đã chặn thư mục `G01/`…`G12/` (mẫu `G[0-9][0-9]/`) và mọi file ảnh, nên ảnh không bị commit. Chỉ chạy script trong `scripts/` của repo này, không dùng `Gxx/scripts/` trong gói (bản cũ, lỗi tiếng Việt trên Windows).

```
K5-L2-Day12-DMS-OMS-student/
  scripts/                 cabin_check.py, cabin_schema.py, rgb_ir_diff.py   (luôn chạy script ở đây)
  templates/               mẫu điền E4, E5, tự đánh giá, TEAM, prompts, exit ticket
  labels_cabin_v1.json     dán vào tab Raw khi tạo project CVAT
  Gxx/                     thư mục coach phát (chép vào đây)
```

Thư mục `Gxx/`:

```
Gxx/
  oms/      S01_rgb.png, S01_ir.png … S10_rgb.png, S10_ir.png, manifest.csv   (SVIRO, BMW X5)
  driver/   D01.png … D06.png                                                   (Drive&Act, NIR)
  labels_cabin_v1.json     dán vào tab Raw khi tạo project CVAT
  scripts/                 bản cũ đi kèm gói, KHÔNG dùng; chạy scripts/ của repo
  ATTRIBUTION.txt, SOURCES.txt
```

Cốt lõi là S01–S08 (16 ảnh) và D01–D06 (6 ảnh), tổng 22 ảnh. S09–S10 (4 ảnh) là phần mở rộng.

## Cần có trên máy

- CVAT local **v2.82.0** đang chạy (xem [INSTALL_CVAT.md](INSTALL_CVAT.md)).
- Python 3.9 trở lên, chỉ dùng thư viện chuẩn để chạy `cabin_check.py`. `rgb_ir_diff.py` cần thêm `pip install pillow numpy` và chỉ dùng ở phần mở rộng.
- Lệnh trong tài liệu viết là `python`. Trên macOS/Linux nếu không có `python` thì gõ `python3`. Trên Windows, nếu `python` mở Microsoft Store thì cài Python từ python.org (tick "Add python.exe to PATH").
- Chrome hoặc Edge.

## Nguồn dữ liệu và giấy phép

- **SVIRO** © DFKI/IEE, CC BY-NC-SA 4.0. Ảnh "grayscale" của SVIRO là IR **mô phỏng** (IR-sim), không phải ảnh hồng ngoại thật. Trong SVIRO không có ai thắt dây an toàn.
- **Drive&Act**, Martin et al., ICCV 2019. Chỉ dùng cho học tập và nghiên cứu trong lớp. Ảnh NIR bị xoay khoảng 90° theo hướng lắp camera.
- Ảnh chỉ nằm trên máy bạn và trong CVAT local. Không commit ảnh vào repo, không đưa lên dịch vụ ngoài, không gửi vào nhóm chat (xem [RULES.md](RULES.md)).
