# Câu 1. Các Phần Mềm Và Mã Băm

- Tìm 3 phần mềm có kèm theo mã băm, kiểm tra mã băm (dùng phần mềm hoặc website) để suy ra độ tin cậy của các phần mềm này.

## Arch Linux

### Link

- [https://archlinux.org/download/](https://archlinux.org/download/)

Danh sách file:

```
../
arch/                                              01-Apr-2026 15:13       -
archlinux-2026.04.01-x86_64.iso                    01-Apr-2026 15:13      1G
archlinux-2026.04.01-x86_64.iso.sig                01-Apr-2026 15:14     141
archlinux-2026.04.01-x86_64.iso.torrent            01-Apr-2026 15:14     82K
archlinux-bootstrap-2026.04.01-x86_64.tar.zst      01-Apr-2026 15:14    116M
archlinux-bootstrap-2026.04.01-x86_64.tar.zst.sig  01-Apr-2026 15:14     141
archlinux-bootstrap-x86_64.tar.zst                 01-Apr-2026 15:14    116M
archlinux-bootstrap-x86_64.tar.zst.sig             01-Apr-2026 15:14     141
archlinux-x86_64.iso                               01-Apr-2026 15:13      1G
archlinux-x86_64.iso.sig                           01-Apr-2026 15:14     141
b2sums.txt                                         01-Apr-2026 15:14     654
sha256sums.txt                                     01-Apr-2026 15:14     398
```

### Checksum

- Được tải từ một mirror, ví dụ:
  - [download.nus.edu.sg/mirror/archlinux/iso/2026.04.01/sha256sums.txt](https://download.nus.edu.sg/mirror/archlinux/iso/2026.04.01/sha256sums.txt)

```
f14bf46afbe782d28835aed99bfa2fe447903872cb9f4b21153196d6ed1d48ae  archlinux-2026.04.01-x86_64.iso
f14bf46afbe782d28835aed99bfa2fe447903872cb9f4b21153196d6ed1d48ae  archlinux-x86_64.iso
128ea3cf9fe0f6a76b006623c48a38147c31fcb973999a621f79c66624394866  archlinux-bootstrap-2026.04.01-x86_64.tar.zst
128ea3cf9fe0f6a76b006623c48a38147c31fcb973999a621f79c66624394866  archlinux-bootstrap-x86_64.tar.zst
```

### Kiểm Tra

- SHA256: Khớp.

```bash
$ sha256sum archlinux-bootstrap-x86_64.tar.zst
128ea3cf9fe0f6a76b006623c48a38147c31fcb973999a621f79c66624394866  archlinux-bootstrap-x86_64.tar.zst
```

- Chữ ký GPG

```bash
$ gpg --verify archlinux-bootstrap-x86_64.tar.zst.sig archlinux-bootstrap-x86_64.tar.zst
gpg: Signature made Wed Apr  1 23:14:28 2026 +08
gpg:                using EDDSA key 3E80CA1A8B89F69CBA57D98A76A5EF9054449A5C
gpg:                issuer "pierre@archlinux.org"
gpg: Good signature from "Pierre Schmitz <pierre@archlinux.org>" [unknown]
gpg: WARNING: The key's User ID is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
      3E80CA1A8B89F69CBA57D98A76A5EF9054449A5C
```

- Có thể xác nhận lại thủ công tại website của chủ nhân chữ ký:
  - [pierre-schmitz.com/gpg-keys/](https://pierre-schmitz.com/gpg-keys/)

```bash
Key uid         = Pierre Schmitz <pierre@archlinux.org>
Key id          = 76A5EF9054449A5C
Key fingerprint = 3E80 CA1A 8B89 F69C BA57  D98A 76A5 EF90 5444 9A5C
```

### Nhận Xét

- Là một hệ điều hành, bảo đảm toàn vẹn dữ liệu và xác thực chủ nhân là cực kỳ quan trọng.
- Cung cấp cả mã checksum và chữ ký số để kiểm tra tính toàn vẹn và xác thực chủ nhân.
- Mức độ tin cậy: Rất Cao.

## VirtualBox

### Link

- [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

### Checksum

- MD5: [https://download.virtualbox.org/virtualbox/7.2.6/MD5SUMS](https://download.virtualbox.org/virtualbox/7.2.6/MD5SUMS)

```
...
2b4a2b8615a57dfc9ede99370635218f *VirtualBox-7.2.6-172322-macOSArm64.dmg
...
```

- SHA256: [https://download.virtualbox.org/virtualbox/7.2.6/SHA256SUMS](https://download.virtualbox.org/virtualbox/7.2.6/SHA256SUMS)

```
...
02da8ad74c0b3da0702359797beae941a3d3ef75d1bb0577bdd001fbe844d2b8 *VirtualBox-7.2.6-172322-macOSArm64.dmg
...
```

### Kiểm Tra

- MD5

```bash
$ md5sum VirtualBox-7.2.6-172322-macOSArm64.dmg 
2b4a2b8615a57dfc9ede99370635218f  VirtualBox-7.2.6-172322-macOSArm64.dmg
```

- SHA256

```bash
$ sha256sum VirtualBox-7.2.6-172322-macOSArm64.dmg
02da8ad74c0b3da0702359797beae941a3d3ef75d1bb0577bdd001fbe844d2b8  VirtualBox-7.2.6-172322-macOSArm64.dmg
```

### Nhận Xét

- Cung cấp checksum, không cung cấp chữ ký số.
- Chỉ kiểm tra toàn vẹn dữ liệu, không xác thực người gửi.
- Tải về từ một nguồn duy nhất.
- Mức độ tin cậy: Cao.

## MariaDB

### Link

- [https://mariadb.org/download/](https://mariadb.org/download/)

### Checksum

- Cung cấp bởi trang web.

```ini
Release date: 2026-02-13
File name: mariadb-12.2.2-winx64.msi
File size: 85.1 MB
Download galera-26.4.25/

Display signature and checksums

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF39AEP5WyjM2MAMF8WVvJMdM0dgFAmmLSG4ACgkQ8WVvJMdM
0dgAuBAAryATEweHUfqZNh9TTnxx+TYsmEPpVXLvc4CqyUm2sgwscrM0r6zZjk6D
Ua3VRw5aRENLYEARxtsVrzITntZQhF192TmieRqJtxv4EgZphirtFR7MSj/n/D1E
gXzS+qTYZ3Cr+/vJPsTvKn+YpVDAImLiSdrTgZymBcA/zFRa0Qyt95zNaLq85cow
beDqIwHWsrcGmhhSfLLvdzqERzIUSA5YU7KMO37XpikHJifzxIMaesL5NFqLgu89
Sfn7TUo5ak0SNw6fZ7w6FhCMJarEj0/YhTYKgXwClRPtVBkycDFwZmegMOb3RG5x
Q41/WPXL3pTx3aDYRRVIHp2OK83N2yrNpRGl1KOnlqk1nu5oSCqYwxw5qi4fu4Gj
aOL+AYpeqqMOFl86EFkBAYQfh3eQ74aybhRxC0rnXxUCIqxJSUSEHVvZvRoH0xFq
Oo3Qm/AjPdaDTWeJAVIxOiH1wgUm5xNEd6LYPHZzL6h4Y6d75Bn1lQzWGgHZDcB/
2IqQ/ejC1VIh/zJclgh4buP0CVGwLVepoL2bPwvlu9kKrmUvxlIuHfCcBs+DBQFd
yX+F7P/B1xEYK5Oo6KYF5ZY1TrD6zK+VIZkxR0EFQySO1Z6niw5euER8SN58guGD
4a9rICfyas0b34xAYM4l7KCpSu50OV7LYPYFa3NZOnOOY+ZzxSw=
=8y8R
-----END PGP SIGNATURE-----

Checksums:

md5sum: f35d2535335d5eea0cc626822ff7990b
sha1sum: 3958ca49d0c7d6c0b5659159134d75337fe887ea
sha256sum: 18b64334b90caad88d68d7281d6ae5cd4deda3728f18dbb3a1816dd0b57cd796
sha512sum: 74d4207e2b23133e53f90a67847a9388e0d2b6d7918b45e61ea7c4fd01175619382dc9240a3c3eb2bdbce8fb10568df6f0b9fa38f5cc926a08d574a0448e768c
```

### Kiểm Tra

- MD5: Khớp.

```bash
$ md5sum mariadb-12.2.2-winx64.msi 
f35d2535335d5eea0cc626822ff7990b  mariadb-12.2.2-winx64.msi
```

- SHA1: Khớp.

```bash
$ sha1sum mariadb-12.2.2-winx64.msi
3958ca49d0c7d6c0b5659159134d75337fe887ea  mariadb-12.2.2-winx64.msi
```

- SHA256: Khớp.

```bash
$ sha256sum mariadb-12.2.2-winx64.msi
18b64334b90caad88d68d7281d6ae5cd4deda3728f18dbb3a1816dd0b57cd796  mariadb-12.2.2-winx64.msi
```

### Nhận Xét

- Cung cấp cả chữ ký số và checksums.
- Phục vụ cả kiểm tra toàn vẹn dữ liệu, đồng thời xác thực người cung cấp.
- Mức độ tin cậy: Rất Cao.
