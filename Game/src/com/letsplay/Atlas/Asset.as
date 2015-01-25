/**
 * Created by julien on 1/24/15.
 */
package com.letsplay.Atlas {
import flash.display.Bitmap;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class Asset {
    [Embed(source="./../../../../assets/fluorine.fnt", mimeType="application/octet-stream")]
    public static const FontXml:Class;

    [Embed(source="./../../../../assets/atlas.xml", mimeType="application/octet-stream")]
    public static const AtlasXml:Class;

    [Embed(source = "./../../../../assets/atlas.png")]
    public static const AtlasTexture:Class;
    public static var atlas:TextureAtlas = new TextureAtlas(Texture.fromEmbeddedAsset(AtlasTexture), XML(new AtlasXml));


    public static const TopScene:Texture = atlas.getTexture("top_scene");
    public static const ClosedScene:Texture = atlas.getTexture("closed_scene");
    public static const Scene:Texture = atlas.getTexture("scene");
    public static const House:Texture = atlas.getTexture("house");
    public static const Bush:Texture = atlas.getTexture("bush");
    public static const Cloud:Texture = atlas.getTexture("cloud");
    public static const LeftTree:Texture = atlas.getTexture("left_tree");
    public static const RightTree:Texture = atlas.getTexture("right_tree");
    public static const Cat:Vector.<Texture> = atlas.getTextures("cat_");
    public static const Public:Texture = atlas.getTexture("public");
    public static const PublicOdd:Texture = atlas.getTexture("public_odd");
    public static const PublicRandom:Texture = atlas.getTexture("public_variation");
    public static const BoyHappy:Vector.<Texture> = atlas.getTextures("Boy_Happy_");
    public static const GirlHappy:Vector.<Texture> = atlas.getTextures("Girl_Happy_");
    public static const BoySad:Vector.<Texture> = atlas.getTextures("Boy_Triste_");
    public static const GirlSad:Vector.<Texture> = atlas.getTextures("Girl_Triste_");

    public function Asset() {
    }
}

}
