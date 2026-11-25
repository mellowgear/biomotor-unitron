# Tile sheets laid out as their screens (unitron gfx --map): each PNG shows the sheet the way its
# tile map draws it (scene records at 0x2C7B6E: colour sheet + map, mono sheet + map, base 0), coloured
# with the scene's palettes. --count is the sheet's tile count (the u16 the game reads); tiles the map
# doesn't use sit after the map's cells. Included by the Makefile.

build/gfx/tiles/2846FE.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2844CC.tilemap --count 133	# scene 35 mono
build/gfx/tiles/2846FE.2bpp.lz: src/gfx/maps/2844CC.tilemap
build/gfx/tiles/28506A.2bpp.lz: GFXFLAGS = --map src/gfx/maps/284F18.tilemap --count 155	# scene 36 mono
build/gfx/tiles/28506A.2bpp.lz: src/gfx/maps/284F18.tilemap
build/gfx/tiles/2858D4.2bpp.lz: GFXFLAGS = --map src/gfx/maps/285782.tilemap --count 150	# scene 37 mono
build/gfx/tiles/2858D4.2bpp.lz: src/gfx/maps/285782.tilemap
build/gfx/tiles/28608B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/285F39.tilemap --count 155	# scene 38 mono
build/gfx/tiles/28608B.2bpp.lz: src/gfx/maps/285F39.tilemap
build/gfx/tiles/286A31.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2868DF.tilemap --count 148	# scene 40 mono
build/gfx/tiles/286A31.2bpp.lz: src/gfx/maps/2868DF.tilemap
build/gfx/tiles/287340.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2871EE.tilemap --count 66	# scene 41 mono
build/gfx/tiles/287340.2bpp.lz: src/gfx/maps/2871EE.tilemap
build/gfx/tiles/287842.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2876C4.tilemap --count 148	# scene 43 mono
build/gfx/tiles/287842.2bpp.lz: src/gfx/maps/2876C4.tilemap
build/gfx/tiles/288052.2bpp.lz: GFXFLAGS = --map src/gfx/maps/287ED4.tilemap --count 124	# scene 42 mono
build/gfx/tiles/288052.2bpp.lz: src/gfx/maps/287ED4.tilemap
build/gfx/tiles/288649.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2884F7.tilemap --count 168	# scene 44 mono
build/gfx/tiles/288649.2bpp.lz: src/gfx/maps/2884F7.tilemap
build/gfx/tiles/28921F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2890CD.tilemap --count 165	# scene 45 mono
build/gfx/tiles/28921F.2bpp.lz: src/gfx/maps/2890CD.tilemap
build/gfx/tiles/289F98.2bpp.lz: GFXFLAGS = --map src/gfx/maps/289C9E.tilemap --count 143	# scene 46 mono
build/gfx/tiles/289F98.2bpp.lz: src/gfx/maps/289C9E.tilemap
build/gfx/tiles/28A78B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28A639.tilemap --count 159	# scene 47 mono
build/gfx/tiles/28A78B.2bpp.lz: src/gfx/maps/28A639.tilemap
build/gfx/tiles/28B2A6.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28B074.tilemap --count 256	# scene 48 mono
build/gfx/tiles/28B2A6.2bpp.lz: src/gfx/maps/28B074.tilemap
build/gfx/tiles/28C219.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28BFE7.tilemap --count 270	# scene 49 mono
build/gfx/tiles/28C219.2bpp.lz: src/gfx/maps/28BFE7.tilemap
build/gfx/tiles/28D2FC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28D0CA.tilemap --count 218	# scene 50 mono
build/gfx/tiles/28D2FC.2bpp.lz: src/gfx/maps/28D0CA.tilemap
build/gfx/tiles/28DEDC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28DCAA.tilemap --count 255	# scene 51 mono
build/gfx/tiles/28DEDC.2bpp.lz: src/gfx/maps/28DCAA.tilemap
build/gfx/tiles/28EE4E.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28ECFC.tilemap --count 144	# scene 52 mono
build/gfx/tiles/28EE4E.2bpp.lz: src/gfx/maps/28ECFC.tilemap
build/gfx/tiles/28F6E2.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28F590.tilemap --count 154	# scene 53 mono
build/gfx/tiles/28F6E2.2bpp.lz: src/gfx/maps/28F590.tilemap
build/gfx/tiles/2901D2.2bpp.lz: GFXFLAGS = --map src/gfx/maps/28FFA0.tilemap --count 202	# scene 54 mono
build/gfx/tiles/2901D2.2bpp.lz: src/gfx/maps/28FFA0.tilemap
build/gfx/tiles/290F69.2bpp.lz: GFXFLAGS = --map src/gfx/maps/290C6F.tilemap --count 165	# scene 55 mono
build/gfx/tiles/290F69.2bpp.lz: src/gfx/maps/290C6F.tilemap
build/gfx/tiles/291922.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2916F0.tilemap --count 275	# scene 56 mono
build/gfx/tiles/291922.2bpp.lz: src/gfx/maps/2916F0.tilemap
build/gfx/tiles/292995.2bpp.lz: GFXFLAGS = --map src/gfx/maps/292763.tilemap --count 264	# scene 57 mono
build/gfx/tiles/292995.2bpp.lz: src/gfx/maps/292763.tilemap
build/gfx/tiles/29395C.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29383A.tilemap --count 109	# scene 61 mono
build/gfx/tiles/29395C.2bpp.lz: src/gfx/maps/29383A.tilemap
build/gfx/tiles/293FC1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/293E9F.tilemap --count 112	# scene 62 mono
build/gfx/tiles/293FC1.2bpp.lz: src/gfx/maps/293E9F.tilemap
build/gfx/tiles/2946FF.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2945DD.tilemap --count 111	# scene 63 mono
build/gfx/tiles/2946FF.2bpp.lz: src/gfx/maps/2945DD.tilemap
build/gfx/tiles/294DCF.2bpp.lz: GFXFLAGS = --map src/gfx/maps/294CAD.tilemap --count 108	# scene 64 mono
build/gfx/tiles/294DCF.2bpp.lz: src/gfx/maps/294CAD.tilemap
build/gfx/tiles/295479.2bpp.lz: GFXFLAGS = --map src/gfx/maps/295387.tilemap --count 77	# scene 65 mono
build/gfx/tiles/295479.2bpp.lz: src/gfx/maps/295387.tilemap
build/gfx/tiles/2959A4.2bpp.lz: GFXFLAGS = --map src/gfx/maps/295882.tilemap --count 113	# scene 66 mono
build/gfx/tiles/2959A4.2bpp.lz: src/gfx/maps/295882.tilemap
build/gfx/tiles/29615B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/295F29.tilemap --count 260	# scene 58 mono
build/gfx/tiles/29615B.2bpp.lz: src/gfx/maps/295F29.tilemap
build/gfx/tiles/2970F3.2bpp.lz: GFXFLAGS = --map src/gfx/maps/296EC1.tilemap --count 262	# scene 59 mono
build/gfx/tiles/2970F3.2bpp.lz: src/gfx/maps/296EC1.tilemap
build/gfx/tiles/2981E9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/297EEF.tilemap --count 328	# scene 60 mono
build/gfx/tiles/2981E9.2bpp.lz: src/gfx/maps/297EEF.tilemap
build/gfx/tiles/299436.2bpp.lz: GFXFLAGS = --map src/gfx/maps/299204.tilemap --count 3	# scene 67 mono
build/gfx/tiles/299436.2bpp.lz: src/gfx/maps/299204.tilemap
build/gfx/tiles/2996DC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2994AA.tilemap --count 133	# scene 35 colour
build/gfx/tiles/2996DC.2bpp.lz: src/gfx/maps/2994AA.tilemap
build/gfx/tiles/29A08A.2bpp.lz: GFXFLAGS = --map src/gfx/maps/299F38.tilemap --count 156	# scene 36 colour
build/gfx/tiles/29A08A.2bpp.lz: src/gfx/maps/299F38.tilemap
build/gfx/tiles/29A9BC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29A86A.tilemap --count 142	# scene 37 colour
build/gfx/tiles/29A9BC.2bpp.lz: src/gfx/maps/29A86A.tilemap
build/gfx/tiles/29B19A.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29B048.tilemap --count 155	# scene 38 colour
build/gfx/tiles/29B19A.2bpp.lz: src/gfx/maps/29B048.tilemap
build/gfx/tiles/29BB59.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29BA07.tilemap --count 148	# scene 40 colour
build/gfx/tiles/29BB59.2bpp.lz: src/gfx/maps/29BA07.tilemap
build/gfx/tiles/29C4B5.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29C363.tilemap --count 67	# scene 41 colour
build/gfx/tiles/29C4B5.2bpp.lz: src/gfx/maps/29C363.tilemap
build/gfx/tiles/29CA0D.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29C88F.tilemap --count 159	# scene 43 colour
build/gfx/tiles/29CA0D.2bpp.lz: src/gfx/maps/29C88F.tilemap
build/gfx/tiles/29D518.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29D39A.tilemap --count 172	# scene 42 colour
build/gfx/tiles/29D518.2bpp.lz: src/gfx/maps/29D39A.tilemap
build/gfx/tiles/29DF9F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29DE4D.tilemap --count 168	# scene 44 colour
build/gfx/tiles/29DF9F.2bpp.lz: src/gfx/maps/29DE4D.tilemap
build/gfx/tiles/29EB7B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29EA29.tilemap --count 165	# scene 45 colour
build/gfx/tiles/29EB7B.2bpp.lz: src/gfx/maps/29EA29.tilemap
build/gfx/tiles/29F95F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/29F665.tilemap --count 144	# scene 46 colour
build/gfx/tiles/29F95F.2bpp.lz: src/gfx/maps/29F665.tilemap
build/gfx/tiles/2A0199.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A0047.tilemap --count 159	# scene 47 colour
build/gfx/tiles/2A0199.2bpp.lz: src/gfx/maps/2A0047.tilemap
build/gfx/tiles/2A0CF9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A0AC7.tilemap --count 264	# scene 48 colour
build/gfx/tiles/2A0CF9.2bpp.lz: src/gfx/maps/2A0AC7.tilemap
build/gfx/tiles/2A1DB4.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A1B82.tilemap --count 246	# scene 49 colour
build/gfx/tiles/2A1DB4.2bpp.lz: src/gfx/maps/2A1B82.tilemap
build/gfx/tiles/2A2D7E.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A2B4C.tilemap --count 218	# scene 50 colour
build/gfx/tiles/2A2D7E.2bpp.lz: src/gfx/maps/2A2B4C.tilemap
build/gfx/tiles/2A3A09.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A37D7.tilemap --count 254	# scene 51 colour
build/gfx/tiles/2A3A09.2bpp.lz: src/gfx/maps/2A37D7.tilemap
build/gfx/tiles/2A49C5.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A4873.tilemap --count 156	# scene 52 colour
build/gfx/tiles/2A49C5.2bpp.lz: src/gfx/maps/2A4873.tilemap
build/gfx/tiles/2A5394.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A5242.tilemap --count 154	# scene 53 colour
build/gfx/tiles/2A5394.2bpp.lz: src/gfx/maps/2A5242.tilemap
build/gfx/tiles/2A5EAD.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A5C7B.tilemap --count 203	# scene 54 colour
build/gfx/tiles/2A5EAD.2bpp.lz: src/gfx/maps/2A5C7B.tilemap
build/gfx/tiles/2A6CAC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A69B2.tilemap --count 164	# scene 55 colour
build/gfx/tiles/2A6CAC.2bpp.lz: src/gfx/maps/2A69B2.tilemap
build/gfx/tiles/2A76A1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A746F.tilemap --count 275	# scene 56 colour
build/gfx/tiles/2A76A1.2bpp.lz: src/gfx/maps/2A746F.tilemap
build/gfx/tiles/2A875D.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A852B.tilemap --count 265	# scene 57 colour
build/gfx/tiles/2A875D.2bpp.lz: src/gfx/maps/2A852B.tilemap
build/gfx/tiles/2A976D.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A964B.tilemap --count 109	# scene 61 colour
build/gfx/tiles/2A976D.2bpp.lz: src/gfx/maps/2A964B.tilemap
build/gfx/tiles/2A9E1F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2A9CFD.tilemap --count 111	# scene 62 colour
build/gfx/tiles/2A9E1F.2bpp.lz: src/gfx/maps/2A9CFD.tilemap
build/gfx/tiles/2AA5A4.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AA482.tilemap --count 110	# scene 63 colour
build/gfx/tiles/2AA5A4.2bpp.lz: src/gfx/maps/2AA482.tilemap
build/gfx/tiles/2AACD6.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AABB4.tilemap --count 108	# scene 64 colour
build/gfx/tiles/2AACD6.2bpp.lz: src/gfx/maps/2AABB4.tilemap
build/gfx/tiles/2AB3D1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AB2DF.tilemap --count 76	# scene 65 colour
build/gfx/tiles/2AB3D1.2bpp.lz: src/gfx/maps/2AB2DF.tilemap
build/gfx/tiles/2AB93F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AB81D.tilemap --count 113	# scene 66 colour
build/gfx/tiles/2AB93F.2bpp.lz: src/gfx/maps/2AB81D.tilemap
build/gfx/tiles/2AC15F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2ABF2D.tilemap --count 260	# scene 58 colour
build/gfx/tiles/2AC15F.2bpp.lz: src/gfx/maps/2ABF2D.tilemap
build/gfx/tiles/2AD13E.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2ACF0C.tilemap --count 262	# scene 59 colour
build/gfx/tiles/2AD13E.2bpp.lz: src/gfx/maps/2ACF0C.tilemap
build/gfx/tiles/2AE290.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2ADF96.tilemap --count 349	# scene 60 colour
build/gfx/tiles/2AE290.2bpp.lz: src/gfx/maps/2ADF96.tilemap
build/gfx/tiles/2AF636.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AF404.tilemap --count 3	# scene 67 colour
build/gfx/tiles/2AF636.2bpp.lz: src/gfx/maps/2AF404.tilemap
build/gfx/tiles/2AF724.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AF662.tilemap --count 81	# scene 0 mono
build/gfx/tiles/2AF724.2bpp.lz: src/gfx/maps/2AF662.tilemap
build/gfx/tiles/2AFC4F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2AFB5D.tilemap --count 83	# scene 2 mono
build/gfx/tiles/2AFC4F.2bpp.lz: src/gfx/maps/2AFB5D.tilemap
build/gfx/tiles/2B0187.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B007D.tilemap --count 96	# scene 3 mono
build/gfx/tiles/2B0187.2bpp.lz: src/gfx/maps/2B007D.tilemap
build/gfx/tiles/2B0760.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B0686.tilemap --count 86	# scene 4 mono
build/gfx/tiles/2B0760.2bpp.lz: src/gfx/maps/2B0686.tilemap
build/gfx/tiles/2B0D53.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B0C31.tilemap --count 103	# scene 5 mono
build/gfx/tiles/2B0D53.2bpp.lz: src/gfx/maps/2B0C31.tilemap
build/gfx/tiles/2B13C4.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B12BA.tilemap --count 111	# scene 6 mono
build/gfx/tiles/2B13C4.2bpp.lz: src/gfx/maps/2B12BA.tilemap
build/gfx/tiles/2B1B4F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B1A45.tilemap --count 113	# scene 7 mono
build/gfx/tiles/2B1B4F.2bpp.lz: src/gfx/maps/2B1A45.tilemap
build/gfx/tiles/2B228A.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B2168.tilemap --count 134	# scene 8 mono
build/gfx/tiles/2B228A.2bpp.lz: src/gfx/maps/2B2168.tilemap
build/gfx/tiles/2B2B4C.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B2A2A.tilemap --count 108	# scene 9 mono
build/gfx/tiles/2B2B4C.2bpp.lz: src/gfx/maps/2B2A2A.tilemap
build/gfx/tiles/2B31BA.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B30DC.tilemap --count 82	# scene 10 mono
build/gfx/tiles/2B31BA.2bpp.lz: src/gfx/maps/2B30DC.tilemap
build/gfx/tiles/2B363F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B35C5.tilemap --count 56	# scene 11 mono
build/gfx/tiles/2B363F.2bpp.lz: src/gfx/maps/2B35C5.tilemap
build/gfx/tiles/2B39CA.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B3950.tilemap --count 57	# scene 12 mono
build/gfx/tiles/2B39CA.2bpp.lz: src/gfx/maps/2B3950.tilemap
build/gfx/tiles/2B3D57.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B3CDD.tilemap --count 57	# scene 13 mono
build/gfx/tiles/2B3D57.2bpp.lz: src/gfx/maps/2B3CDD.tilemap
build/gfx/tiles/2B4124.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B40AA.tilemap --count 58	# scene 14 mono
build/gfx/tiles/2B4124.2bpp.lz: src/gfx/maps/2B40AA.tilemap
build/gfx/tiles/2B44F9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B447F.tilemap --count 59	# scene 15 mono
build/gfx/tiles/2B44F9.2bpp.lz: src/gfx/maps/2B447F.tilemap
build/gfx/tiles/2B48DC.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B4862.tilemap --count 59	# scene 16 mono
build/gfx/tiles/2B48DC.2bpp.lz: src/gfx/maps/2B4862.tilemap
build/gfx/tiles/2B4CEF.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B4C75.tilemap --count 59	# scene 17 mono
build/gfx/tiles/2B4CEF.2bpp.lz: src/gfx/maps/2B4C75.tilemap
build/gfx/tiles/2B50E2.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B5068.tilemap --count 58	# scene 18 mono
build/gfx/tiles/2B50E2.2bpp.lz: src/gfx/maps/2B5068.tilemap
build/gfx/tiles/2B54F2.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B5478.tilemap --count 59	# scene 19 mono
build/gfx/tiles/2B54F2.2bpp.lz: src/gfx/maps/2B5478.tilemap
build/gfx/tiles/2B58A1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B5827.tilemap --count 57	# scene 20 mono
build/gfx/tiles/2B58A1.2bpp.lz: src/gfx/maps/2B5827.tilemap
build/gfx/tiles/2B5CC2.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B5BB8.tilemap --count 91	# scene 21 mono
build/gfx/tiles/2B5CC2.2bpp.lz: src/gfx/maps/2B5BB8.tilemap
build/gfx/tiles/2B623E.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B6134.tilemap --count 95	# scene 22 mono
build/gfx/tiles/2B623E.2bpp.lz: src/gfx/maps/2B6134.tilemap
build/gfx/tiles/2B68A3.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B6781.tilemap --count 123	# scene 23 mono
build/gfx/tiles/2B68A3.2bpp.lz: src/gfx/maps/2B6781.tilemap
build/gfx/tiles/2B7099.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B6F8F.tilemap --count 81	# scene 24 mono
build/gfx/tiles/2B7099.2bpp.lz: src/gfx/maps/2B6F8F.tilemap
build/gfx/tiles/2B75D0.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B74DE.tilemap --count 102	# scene 25 mono
build/gfx/tiles/2B75D0.2bpp.lz: src/gfx/maps/2B74DE.tilemap
build/gfx/tiles/2B7C12.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B7B38.tilemap --count 89	# scene 26 mono
build/gfx/tiles/2B7C12.2bpp.lz: src/gfx/maps/2B7B38.tilemap
build/gfx/tiles/2B818B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B80AD.tilemap --count 87	# scene 27 mono
build/gfx/tiles/2B818B.2bpp.lz: src/gfx/maps/2B80AD.tilemap
build/gfx/tiles/2B877D.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B8673.tilemap --count 103	# scene 28 mono
build/gfx/tiles/2B877D.2bpp.lz: src/gfx/maps/2B8673.tilemap
build/gfx/tiles/2B8E26.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B8D32.tilemap --count 79	# scene 29 mono
build/gfx/tiles/2B8E26.2bpp.lz: src/gfx/maps/2B8D32.tilemap
build/gfx/tiles/2B9345.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B923B.tilemap --count 100	# scene 30 mono
build/gfx/tiles/2B9345.2bpp.lz: src/gfx/maps/2B923B.tilemap
build/gfx/tiles/2B9948.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B9826.tilemap --count 110	# scene 31 mono
build/gfx/tiles/2B9948.2bpp.lz: src/gfx/maps/2B9826.tilemap
build/gfx/tiles/2BA050.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2B9F2E.tilemap --count 107	# scene 32 mono
build/gfx/tiles/2BA050.2bpp.lz: src/gfx/maps/2B9F2E.tilemap
build/gfx/tiles/2BA726.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BA604.tilemap --count 88	# scene 33 mono
build/gfx/tiles/2BA726.2bpp.lz: src/gfx/maps/2BA604.tilemap
build/gfx/tiles/2BACB3.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BAB91.tilemap --count 126	# scene 34 mono
build/gfx/tiles/2BACB3.2bpp.lz: src/gfx/maps/2BAB91.tilemap
build/gfx/tiles/2BB4D1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BB40F.tilemap --count 81	# scene 0 colour
build/gfx/tiles/2BB4D1.2bpp.lz: src/gfx/maps/2BB40F.tilemap
build/gfx/tiles/2BBA54.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BB962.tilemap --count 83	# scene 2 colour
build/gfx/tiles/2BBA54.2bpp.lz: src/gfx/maps/2BB962.tilemap
build/gfx/tiles/2BBFD5.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BBECB.tilemap --count 96	# scene 3 colour
build/gfx/tiles/2BBFD5.2bpp.lz: src/gfx/maps/2BBECB.tilemap
build/gfx/tiles/2BC5F9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BC51F.tilemap --count 86	# scene 4 colour
build/gfx/tiles/2BC5F9.2bpp.lz: src/gfx/maps/2BC51F.tilemap
build/gfx/tiles/2BCC2E.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BCB0C.tilemap --count 103	# scene 5 colour
build/gfx/tiles/2BCC2E.2bpp.lz: src/gfx/maps/2BCB0C.tilemap
build/gfx/tiles/2BD2ED.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BD1E3.tilemap --count 111	# scene 6 colour
build/gfx/tiles/2BD2ED.2bpp.lz: src/gfx/maps/2BD1E3.tilemap
build/gfx/tiles/2BDABF.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BD9B5.tilemap --count 113	# scene 7 colour
build/gfx/tiles/2BDABF.2bpp.lz: src/gfx/maps/2BD9B5.tilemap
build/gfx/tiles/2BE251.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BE12F.tilemap --count 134	# scene 8 colour
build/gfx/tiles/2BE251.2bpp.lz: src/gfx/maps/2BE12F.tilemap
build/gfx/tiles/2BEB5F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BEA3D.tilemap --count 108	# scene 9 colour
build/gfx/tiles/2BEB5F.2bpp.lz: src/gfx/maps/2BEA3D.tilemap
build/gfx/tiles/2BF21C.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BF13E.tilemap --count 81	# scene 10 colour
build/gfx/tiles/2BF21C.2bpp.lz: src/gfx/maps/2BF13E.tilemap
build/gfx/tiles/2BF6DA.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BF660.tilemap --count 56	# scene 11 colour
build/gfx/tiles/2BF6DA.2bpp.lz: src/gfx/maps/2BF660.tilemap
build/gfx/tiles/2BFAB9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BFA3F.tilemap --count 57	# scene 12 colour
build/gfx/tiles/2BFAB9.2bpp.lz: src/gfx/maps/2BFA3F.tilemap
build/gfx/tiles/2BFE8F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2BFE15.tilemap --count 57	# scene 13 colour
build/gfx/tiles/2BFE8F.2bpp.lz: src/gfx/maps/2BFE15.tilemap
build/gfx/tiles/2C02A9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C022F.tilemap --count 58	# scene 14 colour
build/gfx/tiles/2C02A9.2bpp.lz: src/gfx/maps/2C022F.tilemap
build/gfx/tiles/2C06C0.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C0646.tilemap --count 59	# scene 15 colour
build/gfx/tiles/2C06C0.2bpp.lz: src/gfx/maps/2C0646.tilemap
build/gfx/tiles/2C0AED.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C0A73.tilemap --count 59	# scene 16 colour
build/gfx/tiles/2C0AED.2bpp.lz: src/gfx/maps/2C0A73.tilemap
build/gfx/tiles/2C0F51.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C0ED7.tilemap --count 59	# scene 17 colour
build/gfx/tiles/2C0F51.2bpp.lz: src/gfx/maps/2C0ED7.tilemap
build/gfx/tiles/2C1388.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C130E.tilemap --count 58	# scene 18 colour
build/gfx/tiles/2C1388.2bpp.lz: src/gfx/maps/2C130E.tilemap
build/gfx/tiles/2C17E0.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C1766.tilemap --count 59	# scene 19 colour
build/gfx/tiles/2C17E0.2bpp.lz: src/gfx/maps/2C1766.tilemap
build/gfx/tiles/2C1BD6.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C1B5C.tilemap --count 57	# scene 20 colour
build/gfx/tiles/2C1BD6.2bpp.lz: src/gfx/maps/2C1B5C.tilemap
build/gfx/tiles/2C2041.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C1F37.tilemap --count 91	# scene 21 colour
build/gfx/tiles/2C2041.2bpp.lz: src/gfx/maps/2C1F37.tilemap
build/gfx/tiles/2C260B.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C2501.tilemap --count 95	# scene 22 colour
build/gfx/tiles/2C260B.2bpp.lz: src/gfx/maps/2C2501.tilemap
build/gfx/tiles/2C2CC1.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C2B9F.tilemap --count 122	# scene 23 colour
build/gfx/tiles/2C2CC1.2bpp.lz: src/gfx/maps/2C2B9F.tilemap
build/gfx/tiles/2C34F7.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C33ED.tilemap --count 81	# scene 24 colour
build/gfx/tiles/2C34F7.2bpp.lz: src/gfx/maps/2C33ED.tilemap
build/gfx/tiles/2C3A71.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C397F.tilemap --count 102	# scene 25 colour
build/gfx/tiles/2C3A71.2bpp.lz: src/gfx/maps/2C397F.tilemap
build/gfx/tiles/2C4107.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C402D.tilemap --count 88	# scene 26 colour
build/gfx/tiles/2C4107.2bpp.lz: src/gfx/maps/2C402D.tilemap
build/gfx/tiles/2C4719.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C463B.tilemap --count 87	# scene 27 colour
build/gfx/tiles/2C4719.2bpp.lz: src/gfx/maps/2C463B.tilemap
build/gfx/tiles/2C4D61.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C4C57.tilemap --count 103	# scene 28 colour
build/gfx/tiles/2C4D61.2bpp.lz: src/gfx/maps/2C4C57.tilemap
build/gfx/tiles/2C5450.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C535C.tilemap --count 79	# scene 29 colour
build/gfx/tiles/2C5450.2bpp.lz: src/gfx/maps/2C535C.tilemap
build/gfx/tiles/2C59C0.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C58B6.tilemap --count 100	# scene 30 colour
build/gfx/tiles/2C59C0.2bpp.lz: src/gfx/maps/2C58B6.tilemap
build/gfx/tiles/2C6006.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C5EE4.tilemap --count 111	# scene 31 colour
build/gfx/tiles/2C6006.2bpp.lz: src/gfx/maps/2C5EE4.tilemap
build/gfx/tiles/2C6761.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C663F.tilemap --count 107	# scene 32 colour
build/gfx/tiles/2C6761.2bpp.lz: src/gfx/maps/2C663F.tilemap
build/gfx/tiles/2C6E87.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C6D65.tilemap --count 88	# scene 33 colour
build/gfx/tiles/2C6E87.2bpp.lz: src/gfx/maps/2C6D65.tilemap
build/gfx/tiles/2C744F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2C732D.tilemap --count 126	# scene 34 colour
build/gfx/tiles/2C744F.2bpp.lz: src/gfx/maps/2C732D.tilemap

# Sheets drawn by one map in the code (LoadCompressedTiles and DrawTilemap in the same routine,
# both WA = 0xC: base 0), coloured with the palette that routine loads
build/gfx/tiles/2DC0C7.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2DBA4F.tilemap --count 500
build/gfx/tiles/2DC0C7.2bpp.lz: src/gfx/maps/2DBA4F.tilemap
build/gfx/tiles/2DDAB9.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2DD7BF.tilemap --count 165
build/gfx/tiles/2DDAB9.2bpp.lz: src/gfx/maps/2DD7BF.tilemap
build/gfx/tiles/2E0426.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E012C.tilemap --count 265
build/gfx/tiles/2E0426.2bpp.lz: src/gfx/maps/2E012C.tilemap
build/gfx/tiles/2E1302.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E1008.tilemap --count 288
build/gfx/tiles/2E1302.2bpp.lz: src/gfx/maps/2E1008.tilemap
build/gfx/tiles/2E231F.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E2025.tilemap --count 175
build/gfx/tiles/2E231F.2bpp.lz: src/gfx/maps/2E2025.tilemap
build/gfx/tiles/2E2E82.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E2B88.tilemap --count 182
build/gfx/tiles/2E2E82.2bpp.lz: src/gfx/maps/2E2B88.tilemap
build/gfx/tiles/2E6C94.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E699A.tilemap --count 267
build/gfx/tiles/2E6C94.2bpp.lz: src/gfx/maps/2E699A.tilemap
build/gfx/tiles/2E79D7.2bpp.lz: GFXFLAGS = --map src/gfx/maps/2E76DD.tilemap --count 336
build/gfx/tiles/2E79D7.2bpp.lz: src/gfx/maps/2E76DD.tilemap
