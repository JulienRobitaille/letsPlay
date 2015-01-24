/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.Atlas {
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Asset {
    [Embed(source="./../../../assets/fluorine.fnt", mimeType="application/octet-stream")]
    public static const FontXml:Class;

    [Embed(source="./../../../assets/atlas.xml", mimeType="application/octet-stream")]
    public static const AtlasXml:Class;

    [Embed(source = "./../../../assets/atlas.png")]
    public static const AtlasTexture:Class;
    public static var atlas = new TextureAtlas(Texture.fromEmbeddedAsset(AtlasTexture), XML(new AtlasXml));

    public function Asset() {
    }
}
}
