//
//  mockResponseProduct.swift
//  LunaShopTests
//
//  Created by Ximena Rotceh Mendoza Gamino on 14/04/25.
//

import Foundation
@testable import LunaShop

public let mockResponseProduct: ResponseProduct = ResponseProduct(
    keywords: "Samsung Series 8 QN55Q8CAMGXZS",
    paging: Paging(total: 1, limit: 10, offset: 0),
    results: [
        Result(
            id: "MLA10043973",
            status: "active",
            domain_id: "MLA-TELEVISIONS",
            settings: Settings(listingStrategy: "catalog_required"),
            name: "Smart TV Samsung Series 8 QN55Q8CAMGXZS QLED curvo 4K 55\"",
            mainFeatures: [],
            attributes: [
                Attribute(id: "BRAND", name: "Marca", valueID: "206", valueName: "Samsung"),
                Attribute(id: "LINE", name: "Línea", valueID: "106912", valueName: "Series 8"),
                Attribute(id: "MODEL", name: "Modelo", valueID: "3380256", valueName: "QN55Q8C"),
                Attribute(id: "ALPHANUMERIC_MODEL", name: "Modelo alfanumérico", valueID: "7651078", valueName: "QN55Q8CAMGXZS"),
                Attribute(id: "DISPLAY_TYPE", name: "Tipo de pantalla", valueID: "3575905", valueName: "QLED"),
                Attribute(id: "DISPLAY_SIZE", name: "Tamaño de la pantalla", valueID: "2538310", valueName: "55 \""),
                Attribute(id: "RESOLUTION_TYPE", name: "Tipo de resolución", valueID: "2685890", valueName: "4K"),
                Attribute(id: "IS_SMART", name: "Es smart", valueID: "242085", valueName: "Sí"),
                Attribute(id: "IS_CURVED", name: "Es curvo", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_HDR", name: "Con HDR", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_USB", name: "Con USB", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_HDMI", name: "Con HDMI", valueID: "242085", valueName: "Sí"),
                Attribute(id: "MAX_RESOLUTION", name: "Resolución máxima", valueID: "7165730", valueName: "3840 px - 2160 px"),
                Attribute(id: "ASPECT_RATIO", name: "Relación de aspecto", valueID: "493284", valueName: "16:9"),
                Attribute(id: "HDMI_PORTS_NUMBER", name: "Cantidad de puertos HDMI", valueID: "1160534", valueName: "4"),
                Attribute(id: "USB_PORTS_NUMBER", name: "Cantidad de puertos USB", valueID: "972678", valueName: "3"),
                Attribute(id: "WITH_WI_FI", name: "Con Wi-Fi", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_BLUETOOTH", name: "Con Bluetooth", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_ETHERNET", name: "Con ethernet", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WIDTH", name: "Ancho", valueID: "8109538", valueName: "122.33 cm"),
                Attribute(id: "DEPTH", name: "Profundidad", valueID: "8109539", valueName: "9.08 cm"),
                Attribute(id: "HEIGHT", name: "Altura", valueID: "8109537", valueName: "70.4 cm"),
                Attribute(id: "WEIGHT", name: "Peso", valueID: "203370", valueName: "20 kg"),
                Attribute(id: "PROCESSOR_CORES_NUMBER", name: "Cantidad de núcleos del procesador", valueID: "7206949", valueName: "4"),
                Attribute(id: "SPEAKERS_NUMBER", name: "Cantidad de parlantes", valueID: "8019559", valueName: "6"),
                Attribute(id: "MAX_SPEAKERS_POWER", name: "Potencia máxima de los parlantes", valueID: "7861486", valueName: "60 W"),
                Attribute(id: "SOUND_MODES", name: "Modos de sonido", valueID: "9872544", valueName: "Dolby Digital Plus"),
                Attribute(id: "WITH_AUTO_POWER_OFF", name: "Con apagado automático", valueID: "242085", valueName: "Sí"),
                Attribute(id: "WITH_SCREEN_SHARE_FUNCTION", name: "Con función screen share", valueID: "242085", valueName: "Sí")
            ], pictures: [
                Picture(id: "", url: "")
            ], parentID: "", childrenIDS: [
                ""
            ]
        )
    ]
)
